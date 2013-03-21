class AddRoleToProjectUser < ActiveRecord::Migration
  def change
    add_column :project_users, :role, :string
  end
end
