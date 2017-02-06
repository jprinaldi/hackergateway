class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show
  end

  def rankings
    @users = User.all.order(solutions_count: :desc).page(params[:page])
    @solutions_counts_users_counts = User.group(:solutions_count).count
  end

  private

  def set_user
    @user = User.includes(solutions: :challenge).friendly.find(params[:id])
  end
end
