class ApplicationController < ActionController::Base
  protect_from_forgery

  #Authenticate User before creating new Project
  before_filter :authenticate_user!
end
