class ProjectsController < ApplicationController

#Authenticate User before creating new Project
  before_filter :authenticate_user!

  #Create the instance of a new Project
  def new
    @project = Project.new();
    logger.info"---------=-----------inspecting current user >>>>>>>>>>> #{current_user.inspect}"
  end


  #Creating and saving the new Project
  def create
    user = current_user
      user.projects << Project.create(params[:project])
     @projects = user.projects
     redirect_to root_path
    #respond_to do |format|
    #  format.js
    #end
  end
end
