class ProjectTypesController < ApplicationController
  def index
    @project_types = ProjectType.order(:name)
  end

  def new
    @project_type = ProjectType.new
  end

  def create
    @project_type = ProjectType.new(params[:project_type])
    if @project_type.save
      flash[:success] = "Object successfully created"
      redirect_to @project_type
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @project_type = ProjectType.find(params[:id])
      if @project_type.update_attributes(params[:project_type])
        flash[:success] = "Object was successfully updated"
        redirect_to @project_type
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @project_type = ProjectType.find(params[:id])
    if @project_type.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to project_types_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to project_types_url
    end
  end
end