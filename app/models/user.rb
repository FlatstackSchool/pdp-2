class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable

  has_many :accounts
  has_many :companies, through: :accounts
end
