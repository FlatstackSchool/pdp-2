class RegistrationsController < ApplicationController
  expose(:registration, attributes: :form_attributes)

  def new
  end

  def create
    result = RegisterUser.call(registration_attributes)

    if result.success?
      redirect_to(root_path, notice: t("flash.registrations.create.notice"))
    else
      flash.now[:error] = result.message
      render :new
    end
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
