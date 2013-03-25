class Sprint < ActiveRecord::Base

  #Attributes accessible
  attr_accessible :name, :number_of_developers, :points, :week

  #Associations
  belongs_to :project
  has_and_belongs_to_many :users

  #Server side validations
  validates :name, :presence => true
end
