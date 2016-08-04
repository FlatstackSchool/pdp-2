class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include CompanyAuthentication

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  before_action :authenticate_company!

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
