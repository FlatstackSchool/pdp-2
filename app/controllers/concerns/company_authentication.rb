module CompanyAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :company_present?

    helper do
      def current_company
        controller.current_company.decorate if company_present?
      end
    end
  end

  def current_company
    @current_company ||= Company.find_by(subdomain: request.subdomain)
  end

  private

  def company_present?
    current_company.present?
  end

  def authenticate_company!
    return unless request.subdomain.present? && !company_present?

    redirect_to root_url(subdomain: nil), alert: t("flash.companies_authentication.alert", subdomain: request.subdomain)
  end
end
