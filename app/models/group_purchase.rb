# frozen_string_literal: true

class GroupPurchase < ApplicationRecord
  belongs_to :group
  belongs_to :purchase
end
