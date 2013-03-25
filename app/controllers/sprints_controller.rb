class SprintsController < ApplicationController

  #filters to be executed before any action in the Sprints controller
  before_filter :fetch_projects
  before_filter :fetch_sprint, :except => [:new, :create]

  def new
    logger.info"!!!!!! In NEW !!!!!!!!!!!!!! Project from before-filter!!!!!!!!!!!!#{@project.inspect}"
    @sprint = Sprint.new()
    #@project = Project.find(params[:project_id])
    @members = @project.users.collect{|member| member.email}
  end

  def create
    logger.info"!!!!!!! In CREATE !!!!!!!!!!!!! Project from before-filter!!!!!!!!!!!!#{@project.inspect}"
    #@project = Project.find(params[:project_id]).includes(:project_users, :users)
    @sprint = Sprint.new(params[:sprint])
    developers = params[:developers]
    logger.info"--------------- inspecting developers ------------------#{developers.inspect}"
    developers.each do |dev|
      logger.info"--------------- inspecting developers ------------------#{dev.inspect}"
      #developer = User.where('email like ?', dev).first
      member = @project.users.where('email like ?', dev).first
      member_dev = @project.project_users.where(:user_id => member.id).first
      logger.info"--------------- inspecting developers ------------------#{member_dev.inspect}"
      member_dev.update_attribute(:developer, true)
    end
    if @sprint.save
      redirect_to project_path(@project)
    else
      render 'new'
    end

  end

  private
  def fetch_projects
    @project = Project.where(params[:project_id]).includes(:users, :project_users).first
  end

  def fetch_sprint
    @sprint = Sprint.find(params[:id])
  end
end
