class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project])
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      flash[:success] = "#{@material.name} successfully created"
      redirect_to project_path(@material.project)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    project = @material.project
    if @material.destroy
      flash[:success] = 'material was successfully deleted.'
      redirect_to project_path(project)
    else
      flash[:error] = 'Something went wrong'
      redirect_to project_path(project)
    end
  end

  def edit
    @project = @material.project
  end

  def update
    project = @material.project
    if @material.update(material_params)
      flash[:success] = "material was successfully updated"
      redirect_to project_path(project)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def material_params
    params.require(:material).permit(:name, :quantity, :ordered, :received, :project_id)
  end

  def set_material
    @material = Material.find(params[:id])
  end
end
