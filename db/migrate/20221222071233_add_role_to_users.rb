# frozen_string_literal: true

# users as Role Users, do the following
class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: 'default'
  end
end
