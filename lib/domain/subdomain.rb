module Domain
  class Subdomain < Domain::Base
    class << self
      def matches?(request)
        request.subdomain.present? && !reserved_names.include?(request.subdomain)
      end
    end
  end
end
