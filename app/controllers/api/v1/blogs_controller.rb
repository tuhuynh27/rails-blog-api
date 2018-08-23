class Api::V1::BlogsController < Api::ApisController
  before_action :set_blog, except: %i[index create]
  before_action :authenticate_user, only: %i[create update destroy]

  def index
    blog = Blog.all
    render json: blog, status: :ok
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: blog, status: :created
    else
      render json: {
        error: blog.errors.full_messages
      }, status: 442
    end
  end

  def show
    render json: @blog, status: :ok
  end

  def update
    if @blog.update(blog_params)
      render json: @blog, status: :ok
    else
      render json: {
        error: @blog.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @blog.destroy
      render head :no_content
    else
      render json: {
        error: @blog.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_blog
    @blog = Blog.find_by_id(params[:id])
    render json: {
      error: 'not found'
    }, status: 404 if @blog.nil?
  end

  def blog_params
    params.permit(:title, :body)
  end
end
