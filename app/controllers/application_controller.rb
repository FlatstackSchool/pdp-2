class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  before_action :redirect_to_root

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def redirect_to_root
    redirect_to root_url(subdomain: nil) if !user_signed_in? && !request.subdomain.blank?
  end
end
