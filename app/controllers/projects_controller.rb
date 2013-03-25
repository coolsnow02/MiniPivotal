class ProjectsController < ApplicationController

  #Create the instance of a new Project
  def new
    @project = Project.new();
  end


  #Creating and saving the new Project
  #Task:Sends mails to new as well as existing user's informing about the invitation to the project
  def create
    @project = Project.create(params[:project])
    @projects = current_user.projects
    @projects << @project
    owner = @project.project_users.where(:user_id => current_user.id).first
    owner.update_attribute(:role, 'owner')
    members = params[:member_emails]
    members = members.split(",")
    members.each do |member|
      user = User.search(member).first
      if user.present? && user!= current_user
        logger.info">>>>>>>>>>!!!!!!!!! inside if user is present >>>>>>>>>>>>>>>"
        p= @project.project_users.new(:user_id => user.id, :project_id => @project.id, :role => 'member')
        p.save
        UserMailer.welcome_email(member).deliver
      else
        logger.info">>>>>>>>>>!!!!! inside else user is present >>>>>>>>>>>>>>>"
        password = 8.times.map{('a'..'z').to_a[rand(26)]}.join
        user = User.new(:email => member, :password => password, :password_confirmation => password)
        if user.save
          logger.info">>>>>>>>>>!! inside save for new user >>>>>>>>>>>>>>>"
          logger.info">>>>>>>>>>!! inside save for new user >>>>>>>>>>>>>>> #{user.id.inspect}"
          p = @project.project_users.new(:user_id => user.id, :project_id => @project.id, :role => 'member')
          logger.info"****************** #{p.inspect}"
          user.skip_confirmation!
          UserMailer.new_user_email(user).deliver
        end
      end
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
