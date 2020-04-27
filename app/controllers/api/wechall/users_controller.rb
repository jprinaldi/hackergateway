# frozen_string_literal: true

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

        render plain: score_data(user).values.join(":")
      end

      private

      def score_data(user)
        {
          username: user.username,
          rank: user.rank,
          score: user.solutions_count,
          max_score: Challenge.count,
          solutions_count: user.solutions_count,
          challenges_count: Challenge.count,
          users_count: User.count
        }
      end

      def restrict_access
        api_key = ApiKey.find_by(token: params[:token])
        head :unauthorized unless api_key
      end
    end
  end
end
