class ProjectsController < ApplicationController
  def index
    @projects = Project.order(:name)
  end

  def new
    @project = Project.new
  end

  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        flash[:success] = "Object was successfully updated"
        redirect_to @project
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Object successfully created"
      redirect_to @project
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'project was successfully deleted.'
      redirect_to projects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to projects_url
    end
  end
end
