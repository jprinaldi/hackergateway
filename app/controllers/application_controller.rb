# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:remote_ip] = request.remote_ip
    payload[:user_id] = current_user.id if current_user
    payload[:admin_user_id] = current_admin_user.id if current_admin_user
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
