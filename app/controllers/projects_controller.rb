class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.order(:name)
  end

  def new
    @project = Project.new
  end

  def update
    if @project.update(project_params)
      flash[:success] = "Object was successfully updated"
      redirect_to projects_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Object successfully created"
      redirect_to projects_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'project was successfully deleted.'
      redirect_to projects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to projects_url
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :project_type_id, :status)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
