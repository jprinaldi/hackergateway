# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def handle_record_not_found
    render "errors/not_found", status: :not_found
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[username name terms_of_service]
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[username name country_code]
    )
  end
end
