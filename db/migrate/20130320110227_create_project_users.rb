class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :project_users, :user_id
    add_index :project_users, :project_id
  end
end
