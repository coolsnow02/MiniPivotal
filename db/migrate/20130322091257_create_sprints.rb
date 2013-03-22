class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.integer :number_of_developers
      t.integer :week
      t.integer :points

      t.timestamps
    end
  end
end
