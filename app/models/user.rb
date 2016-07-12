class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  has_many :accounts
  has_many :companies, through: :accounts
end
