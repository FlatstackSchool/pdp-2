class Registration
  include ActiveModel::Model
  include SubdomainValidation

  attr_accessor :subdomain, :email, :password, :password_confirmation

  validates :subdomain, :email, :password, :password_confirmation, presence: true
  validates :email, format: Devise.email_regexp
  validates :subdomain, subdomain: true
  validate :unique_email

  # TODO:
  # * create user & company

  def save
    valid?
  end

  def attributes=(attributes)
    attributes.each do |key, value|
      public_send "#{key}=", value
    end
  end

  private

  def unique_email
    if User.exists?(email: email)
      errors.add(:email, "Email has already been taken.")
    end
  end

  def unique_subdomain
    if Company.exists?(subdomain: subdomain)
      errors.add(:subdomain, "Subdomain has already been taken.")
    end
  end
end
