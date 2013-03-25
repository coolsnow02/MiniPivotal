class Project < ActiveRecord::Base

  #Associations
  has_many :project_users, :dependent => :destroy
  has_many :users, :through => :project_users
  has_many :sprints, :dependent => :destroy

  #Attributes accessible
  attr_accessible :name, :description, :member_limit

  #Scope: Default scope to order selected projects
  default_scope order("created_at DESC")

  #Validations for Project
  validates :name, :presence => true, :length => {:minimum => 3}, :uniqueness => true
  validates :description, :presence => true, :length => {:minimum => 3, :maximum => 50}
  validates :member_limit, :length => {:minimum => 0, :maximum => 10}, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}

  def project_owner(project, user)
    project.project_users.where(:user_id => user.id).first.role
  end

end
