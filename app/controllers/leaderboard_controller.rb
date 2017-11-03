# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index
    @default_per_page = 10
    @users = User.ranked
                 .page(params[:page])
                 .per(params[:per] || @default_per_page)
    @solutions_counts_users_counts = User.group(:solutions_count).count
  end
end
