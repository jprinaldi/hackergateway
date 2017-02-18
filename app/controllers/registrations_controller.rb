class RegistrationsController < Devise::RegistrationsController # :nodoc:
  protected

  def after_update_path_for(resource)
    user_path(resource)
  end
end
