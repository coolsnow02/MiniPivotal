class SprintsController < ApplicationController

  def new
    @sprint = Sprint.new()
    @project = params[:project_id]
  end

  def create
    sprint = Sprint.new(params[:sprint])
  end
end
