class SignUpsController < ApplicationController
  expose(:sign_up, attributes: :sign_up_attributes)

  def new
  end

  def create
    sign_up.save
    respond_with(sign_up, location: root_path)
  end

  private

  def sign_up_attributes
    params.fetch(:sign_up, {}).permit(:subdomain, :email, :password, :password_confirmation)
  end
end
