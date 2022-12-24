# Group
class Group < ApplicationRecord
  belongs_to :user
  has_many :purchases, through: :group_purchases
  has_many :group_purchases

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
