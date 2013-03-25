class Sprint < ActiveRecord::Base

  #Attributes accessible
  attr_accessible :name, :number_of_developers, :points, :week

  #Associations
  belongs_to :project
  has_and_belongs_to_many :users

  #Server side validations
  validates :name, :presence => true, :length => {:minimum => 2,:maximum => 15}, :uniqueness => true
  validates :points, :presence => true
  validates :week, :presence => true
  validates :number_of_developers, :presence => true, :length =>{:minimum => 0,:maximum => 10}

end
