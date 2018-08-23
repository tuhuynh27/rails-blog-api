class Api::V1::CommentsController < Api::ApisController
  before_action :set_blog
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_user, only: %i[update destroy]

  def index
    comments = @blog.comments
    render json: comments, status: :ok
  end

  def create
    comment = @blog.comments.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: {
        error: comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render head :no_content
    else
      render json: {
        error: @comment.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_blog
    @blog = Blog.find_by_id(params[:blog_id])
    render json: {
      error: 'not found'
    }, status: 404 if @blog.nil?
  end

  def set_comment
    @comment = Comment.find_by_id(params[:id])
    render json: {
      error: 'not found'
    }, status: 404 if @comment.nil?
  end

  def comment_params
    params.permit(:content, :name, :email)
  end
end
