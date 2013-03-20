class Project < ActiveRecord::Base

  #Associations
  has_many :project_user
  has_many :users, :through => :project_user

  #Attributes accessible
  attr_accessible :name, :description, :member_limit
end
