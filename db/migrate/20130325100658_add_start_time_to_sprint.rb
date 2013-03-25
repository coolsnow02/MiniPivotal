class AddStartTimeToSprint < ActiveRecord::Migration
  def change
    add_column :sprints, :start_time, :date
  end
end
