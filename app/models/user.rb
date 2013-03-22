class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #Included Devise modules
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :project_user
  has_many :projects, :through => :project_user
  has_and_belongs_to_many :sprints

  # Accessible attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #User Validations
  validates :email, :presence => true, :uniqueness => true, :length => {:minimum => 5}, :format => {:with => (/\b[A-Z0-9._%a-z-]+@(?:[A-Z0-9a-z-]+.)+[A-Za-z]{2,4}\z/)}
  validates :password, :presence => true, :length => {:minimum => 8}, :confirmation => true
  validates :password_confirmation, :presence => true

  def self.search(search)
    logger.info "#################model#########################{search.inspect}"
    if search.present?
      where("email LIKE ?", "%#{search}%")
    end
  end

  def member_emails=(emails)
    self.email = emails.split(",")
  end
end
