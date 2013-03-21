class Project < ActiveRecord::Base

  #Associations
  has_many :project_user
  has_many :users, :through => :project_user

  #Attributes accessible
  attr_accessible :name, :description, :member_limit

  #Validations for Project
  validates :name, :presence => true, :length => {:minimum => 3}
  validates :description, :presence => true, :length => {:minimum => 3, :maximum => 50}
  validates :member_limit, :length => {:minimum => 0, :maximum => 10}, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
end
