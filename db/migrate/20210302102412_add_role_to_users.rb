# frozen_string_literal: true

#This class adds role column to our model
class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, default: 'member'
  end
end
