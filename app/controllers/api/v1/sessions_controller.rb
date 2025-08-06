class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "認証に失敗しました" }, status: :unauthorized
    end
  end
end