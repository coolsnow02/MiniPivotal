class Task < ActiveRecord::Base

#Attributes accessible within the application for read-write purposes
  attr_accessible :task

#Associations for Tasks
has_many :comments
belongs_to :sprint
end
