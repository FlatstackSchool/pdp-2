module Domain
  class Main < Domain::Base
    class << self
      def matches?(request)
        request.subdomain.blank? || reserved_names.include?(request.subdomain)
      end
    end
  end
end
