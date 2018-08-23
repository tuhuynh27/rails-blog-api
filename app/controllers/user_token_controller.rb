class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  def create
    render json: {
      jwt: auth_token.token,
      expires_at: (Time.now + Knock.token_lifetime).to_i,
      email: @entity.email,
      name: @entity.name
    }, status: :created
  end
end