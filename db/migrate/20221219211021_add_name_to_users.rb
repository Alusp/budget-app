# frozen_string_literal: true

# users as AddNameToUsers, do the following
class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
  end
end
