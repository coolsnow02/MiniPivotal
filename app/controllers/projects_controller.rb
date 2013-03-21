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

  #Search existing users from record or add a new user email to send invites
  def show_invi_form
    logger.info"--------------------checking 'q' format"
    @users = User.where("email LIKE ?", "%#{params[:q]}%")# - current_user
    member = @users.collect{|u| {:id => u.email, :email => u.email}}
    #member = params[:q]
    if ((/\b[A-Z0-9._%a-z-]+@(?:[A-Z0-9a-z-]+.)+[A-Za-z]{2,4}\z/).match(params[:q]))
      logger.info"----------"
      member = [{:id => params[:q], :email => params[:q]}]
    end
    respond_to do |format|
      format.html
      format.json { render :json => member}
    end
  end
end
