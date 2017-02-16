module Api
  module Wechall
    class UsersController < ApplicationController # :nodoc:
      before_action :restrict_access

      def validate
        if User.exists?(username: params[:username], email: params[:email])
          render plain: "1"
        else
          render plain: "0"
        end
      end

      def score
        user = User.find_by(username: params[:username])
        head(:no_content) && return unless user
        data = {
          score: user.solutions_count,
          max_score: Challenge.count
        }
        render plain: data.values.join(":")
      end

      private

      def restrict_access
        api_key = ApiKey.find_by(token: params[:token])
        head :unauthorized unless api_key
      end
    end
  end
end
