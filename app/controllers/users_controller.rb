# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show impersonate]
  before_action :authenticate_admin_user!, only: %i[impersonate]

  def index
    @users = User.all
  end

  def show; end

  def impersonate
    bypass_sign_in @user, scope: :user
    redirect_to root_path
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
