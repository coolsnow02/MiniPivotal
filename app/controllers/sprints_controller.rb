class SprintsController < ApplicationController

  def new
    @sprint = Sprint.new()
    @project = params[:project_id]
  end

  def create
    @project = params[:project_id]
    @sprint = Sprint.new(params[:sprint])
    if @sprint.save
      redirect_to project_path(@project)
    else
      render 'new'
    end

  end
end
