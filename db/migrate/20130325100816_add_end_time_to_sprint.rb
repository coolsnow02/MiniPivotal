class AddEndTimeToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :end_time, :date
  end
end
