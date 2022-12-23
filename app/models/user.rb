# frozen_string_literal: true

class User < ApplicationRecord
  has_many :groups
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :name, :email
  validates :name, :email, presence: true
  validates :password, length: { minimum: 7 }
  # ROLES = %i[admin default].freeze
end
