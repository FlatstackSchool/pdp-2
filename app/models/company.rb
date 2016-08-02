class Company < ActiveRecord::Base
  has_many :accounts
  has_many :users, through: :accounts

  def title
    @title ||= subdomain.humanize
  end
end
