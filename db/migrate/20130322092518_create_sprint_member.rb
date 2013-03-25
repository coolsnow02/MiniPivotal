class CreateSprintMember < ActiveRecord::Migration
  def change
    create_table :sprints_users, :id => false do |t|
      t.references :sprint
      t.references :user

      t.timestamps
    end
    add_index :sprints_users, :sprint_id
    add_index :sprints_users, :user_id
  end
end
