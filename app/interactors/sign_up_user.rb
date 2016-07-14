class SignUpUser
  include Interactor

  delegate :subdomain, :email, :password, :password_confirmation, :user, :company, :account, to: :context

  def call
    ActiveRecord::Base.transaction do
      context.user = User.create!(user_attributes)
      context.company = Company.create!(company_attributes)
      context.account = Account.create!(account_attributes)
    end
  rescue ActiveRecord::StatementInvalid
    context.fail!
  end

  private

  def user_attributes
    { email: email, password: password, password_confirmation: password_confirmation }
  end

  def company_attributes
    { subdomain: subdomain }
  end

  def account_attributes
    { user: user, company: company, owner: true }
  end
end
