module CurrentCompany
  extend ActiveSupport::Concern

  included do
    def current_company
      @current_company ||= Company.find_by(subdomain: request.subdomain)
    end

    helper_method :current_company

    before_action :check_current_company!

    private

    def check_current_company!
      redirect_to root_url(subdomain: nil) if request.subdomain.present? && current_company.nil?
    end
  end
end
