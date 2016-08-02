module Domain
  class Base
    RESERVED_NAMES = %w(www http https ftp sftp ssl ns mx pop smtp admin mail users).freeze

    class << self
      def reserved_names
        RESERVED_NAMES
      end
    end
  end
end
