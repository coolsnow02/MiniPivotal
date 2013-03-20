class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #Included Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :project_user
  has_many :projects, :through => :project_user

  # Accessible attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me

end
