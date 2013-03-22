class CreateSprintMember < ActiveRecord::Migration
  def change
    create_table :sprint_members do |t|
      t.references :sprint
      t.references :user

      t.timestamps
    end
    add_index :sprint_members, :sprint_id
    add_index :sprint_members, :user_id
  end
end
