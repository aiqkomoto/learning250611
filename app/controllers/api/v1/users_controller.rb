module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'SUCCESS', data: user }, status: :created
        else
          render json: { status: 'ERROR', errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email)
      end
    end
  end
end