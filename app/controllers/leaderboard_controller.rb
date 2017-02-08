class LeaderboardController < ApplicationController
  def index
    @users = User.all.order(solutions_count: :desc).page(params[:page])
    @solutions_counts_users_counts = User.group(:solutions_count).count
  end
end
