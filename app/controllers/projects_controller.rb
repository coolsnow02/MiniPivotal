class ProjectsController < ApplicationController

  #Create the instance of a new Project
  def new
    @project = Project.new();
    logger.info"---------=-----------inspecting current user >>>>>>>>>>> #{current_user.inspect}"
  end


  #Creating and saving the new Project
  #Task:Sends mails to new as well as existing user's informing about the invitation to the project
  def create
    @project = Project.create(params[:project])
    @projects = current_user.projects
    @projects << @project
    members = params[:member_emails]
    logger.info">>>> checking members >>>>>>>>>>>>>> #{members.inspect}"
    members = members.split(",")
    logger.info">>>> checking members as array >>>>>>>>>>>>>> #{members.inspect}"
    members.each do |member|
      user = User.search(member)
      if user.present?
        UserMailer.welcome_email(member).deliver
      else
        password = 8.times.map{('a'..'z').to_a[rand(26)]}.join
        user = @project.users.new(:email => member, :password => password, :password_confirmation => password)
        logger.info"#############################{user.inspect}"
        logger.info"#############################{(@project.project_user.where(:user_id => user.id)).inspect}"
        logger.info"#############################{(@project.project_user.where(:user_id => user.id).first).inspect}"
        if user.save
          user.skip_confirmation!
          UserMailer.new_user_email(user).deliver
        end
      end
      #if member==current_user.email
      #  project_member = User.where(:email => member).first
      #  @project.project_user.where(:user_id => project_member.id, :project_id => @project.id).first.role = "owner"
        #else
        #  project_member = User.where(:email => member)
        #  @project.project_user.new(:user_id => project_member.id, :project_id => @project.id, :role => "member")
      #end
    end
    redirect_to root_path
  end

  #Search existing users from record or add a new user email to send invites
  def show_invi_form
    logger.info"--------------------checking 'q' format--------- #{params[:q].inspect}"
    @users = User.search(params[:q])
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

  def show
    @project = Project.find(params[:id])
  end
end
