class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_categories

  def get_categories
    @categories = Category.all
  end
end
