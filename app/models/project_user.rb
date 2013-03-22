class ProjectUser < ActiveRecord::Base

  #Attribute accessible
  attr_accessible :role, :project_id, :user_id

  #Associations
  belongs_to :user
  belongs_to :project
end
