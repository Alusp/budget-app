# frozen_string_literal: true

# GroupPurchase

class GroupPurchase < ApplicationRecord
  belongs_to :group
  belongs_to :purchase
end
