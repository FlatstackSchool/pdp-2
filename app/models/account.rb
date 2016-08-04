class Account < ActiveRecord::Base
  belongs_to :company
  belongs_to :user

  scope :owners, -> { where(owner: true) }
  scope :members, -> { where(owner: false) }

  validates :company, :user, presence: true
end
