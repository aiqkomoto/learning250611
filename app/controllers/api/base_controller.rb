class Api::BaseController < ActionController::API
  before_action :authenticate_user!
  attr_reader :current_user

  private

  def authenticate_user!
    auth  = request.headers["Authorization"].to_s
    token = auth.split.last
    return render(json: { error: "認証トークンがありません" }, status: :unauthorized) if token.blank?

    payload = JsonWebToken.decode(token) # Expired/DecodeError は rescue で401に
    @current_user = User.find_by(id: payload[:user_id])
    return render(json: { error: "ユーザーが存在しません" }, status: :unauthorized) unless @current_user
  rescue JWT::ExpiredSignature
    render json: { error: "token_expired" }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { error: "invalid_token", detail: e.message }, status: :unauthorized
  end
end