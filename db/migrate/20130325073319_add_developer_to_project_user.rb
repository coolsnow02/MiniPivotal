class AddDeveloperToProjectUser < ActiveRecord::Migration
  def change
    add_column :project_users, :developer, :boolean
  end
end
