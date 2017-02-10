class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_path, alert: exception.message }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :terms_of_service])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :country_code])
  end

  def get_categories
    @categories = Category.all
  end
end
