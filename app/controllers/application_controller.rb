class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include CurrentCompany

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
