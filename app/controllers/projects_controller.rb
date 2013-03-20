class ProjectsController < ApplicationController

#Authenticate User before creating new Project
  before_filter :authenticate_user!

  #Create the instance of a new Project
  def new
    @project = Project.new();
  end


  #Creating and saving the new Project
  def create
     @project = Project.create(params[:project])
     redirect_to "/"
    #respond_to do |format|
    #  format.js
    #end
  end
end
