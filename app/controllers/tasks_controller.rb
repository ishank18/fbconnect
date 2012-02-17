class TasksController < ApplicationController
  def index
  	@tasks = Task.all
  end

  def new
  end

  def edit
  	@task = Task.where(:id => params[:id]).first
  end

end
