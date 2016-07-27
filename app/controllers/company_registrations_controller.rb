class CompanyRegistrationsController < ApplicationController
  expose(:user, attributes: :user_attributes)

  def new
  end

  def create
    result = RegisterCompanyUser.call(registration_attributes)

    if result.success?
      redirect_to(root_path, notice: "Welcome! You have signed up successfully.")
    else
      flash.now[:error] = result.message
      render :new
    end
  end

  private

  def user_attributes
    params
      .fetch(:user, {})
      .permit(:email, :password, :password_confirmation)
  end

  def registration_attributes
    user_attributes.merge(warden: warden, subdomain: request.subdomain)
  end
end
