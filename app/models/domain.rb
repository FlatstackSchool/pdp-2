class Domain
  RESERVED_NAMES = %w(www http https ftp sftp ssl ns mx pop smtp admin mail users).freeze

  attr_reader :request
  private :request

  def initialize(request)
    @request = request
  end

  def subdomain?
    request.subdomain.present? && !RESERVED_NAMES.include?(request.subdomain)
  end

  def main?
    !subdomain?
  end
end
