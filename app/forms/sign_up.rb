class SignUp
  include ActiveModel::Model
  include SubdomainValidation

  attr_accessor :subdomain, :email, :password, :password_confirmation

  validates :subdomain, :email, :password, :password_confirmation, presence: true
  validates :email, format: Devise.email_regexp
  validates :subdomain, subdomain: true

  # TODO:
  # * uniq email, subdomain
  # * create user & company

  def save
    valid?
  end

  def attributes=(attributes)
    attributes.each do |key, value|
      public_send "#{key}=", value
    end
  end
end
