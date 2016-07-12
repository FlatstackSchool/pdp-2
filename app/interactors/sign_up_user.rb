class SignUpUser
  include Interactor

  delegate :subdomain, :email, :password, :password_confirmation, :user, :company, to: :context

  def call
    ActiveRecord::Base.transaction do
      context.user = User.create!(user_attributes)
      context.company = user.companies.create!(company_attributes)
      context.fail! unless valid?
    end
  end

  private

  def user_attributes
    { email: email, password: password, password_confirmation: password_confirmation }
  end

  def company_attributes
    { subdomain: subdomain }
  end

  def valid?
    user.valid? && company.valid?
  end
end
