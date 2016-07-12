class RegistrationsController < ApplicationController
  expose(:registration, attributes: :registration_attributes)

  def new
  end

  def create
    SignUpUser.call(registration_attributes) if registration.valid?
    respond_with(registration, location: root_path)
  end

  private

  def registration_attributes
    params.fetch(:registration, {}).permit(:subdomain, :email, :password, :password_confirmation)
  end
end
