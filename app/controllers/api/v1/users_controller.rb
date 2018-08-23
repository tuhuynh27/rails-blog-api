class Api::V1::UsersController < Api::ApisController
  def index
    if current_user
      render json: current_user.custom_response
    else
      render json: {
        error: 'not signed in'
      }, status: 400
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {
        error: user.errors.full_messages
      }, status: 442
    end
  end

  def user_params
    params.permit(:email, :name,
                  :password, :password_confirmation)
  end
end