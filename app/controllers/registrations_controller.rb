class RegistrationsController < ApplicationController
  expose(:registration, attributes: :form_attributes)

  def new
  end

  def create
    RegisterUser.call(registration_attributes) if registration.valid?

    respond_with(registration, location: root_path)
  end

  private

  def form_attributes
    params
      .fetch(:registration, {})
      .permit(:subdomain, :email, :password, :password_confirmation)
  end

  def registration_attributes
    form_attributes.merge(warden: warden)
  end
end
