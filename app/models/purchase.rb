# Purchase
class Purchase < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :groups, through: :group_purchases
  has_many :group_purchases

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
