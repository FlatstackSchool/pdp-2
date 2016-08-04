class CompanyDecorator < ApplicationDecorator
  def title
    object.subdomain.humanize
  end
end
