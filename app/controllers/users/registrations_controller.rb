class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @registration = build_resource # Needed for Merit
    super
  end

  def update
    @registration = resource # Needed for Merit
    super
  end
end
