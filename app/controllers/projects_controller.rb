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
    #@project = @projects.where(:id != nil).last

    redirect_to root_path

  end

  def show_invi_form
    @users = User.where("email LIKE ?", "%#{params[:q]}%")
    if !@users
      #user_email =
    end
    respond_to do |format|
      format.html
      format.json { render :json => @users.map(&:attributes)}
    end
  end
end
