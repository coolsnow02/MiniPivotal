class Comment < ActiveRecord::Base

#Attributes accessible for Comments for read-write purposes
  attr_accessible :comment

#Associations for Comments
belongs_to :task
end
