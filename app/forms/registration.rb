class Registration
  include ActiveModel::Model
  include SubdomainValidation

  ATTRIBUTES = %i(subdomain email password password_confirmation).freeze

  attr_accessor *ATTRIBUTES

  validates :subdomain, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, format: Devise.email_regexp
  validates :subdomain, subdomain: true
  validate :unique_email
  validate :unique_subdomain

  def attributes=(attributes)
    attributes.each do |key, value|
      public_send "#{key}=", value
    end
  end

  private

  def unique_email
    errors.add(:email, "Email has already been taken.") if User.exists?(email: email)
  end

  def unique_subdomain
    if Company.exists?(subdomain: subdomain)
      errors.add(:subdomain, "Subdomain has already been taken.")
    end
  end
end
