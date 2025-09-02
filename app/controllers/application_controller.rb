class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  helper_method :current_user

  before_action :authenticate_user!

  def authenticate_user!
    header = request.headers['Authorization']
    unless header.present?
      render json: { error: '認証トークンがありません' }, status: :unauthorized and return
    end

    token = header.split(' ').last

    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find_by(id: decoded[:user_id])
      render json: { error: '認証エラー' }, status: :unauthorized unless @current_user
    rescue JWT::DecodeError, JWT::ExpiredSignature
      render json: { error: 'トークンが不正か期限切れです' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end