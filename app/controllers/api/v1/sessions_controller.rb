class Api::V1::SessionsController < Api::BaseController
  skip_before_action :authenticate_user!, only: :create

  def create
    email    = params[:email].to_s
    password = params[:password].to_s

    user = User.find_by(email: email)

    if user&.authenticate(password)
      token = JsonWebToken.encode(user_id: user.id)
      response.set_header("Authorization", "Bearer #{token}")
      render json: {
        token: token,
        token_type: "Bearer",
        expires_in: 24.hours.to_i
      }, status: :ok
    else
      render json: { error: "invalid_email_or_password" }, status: :unauthorized
    end
  end
end