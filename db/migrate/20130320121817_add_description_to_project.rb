class AddDescriptionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :description, :string
    add_column :projects, :member_limit, :integer
  end
end
