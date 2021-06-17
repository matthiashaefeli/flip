class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project])
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:success] = "#{@condition.name} successfully created"
      redirect_to project_path(@condition.project)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    project = @condition.project
    if @condition.destroy
      flash[:success] = 'condtition was successfully deleted.'
      redirect_to project_path(project)
    else
      flash[:error] = 'Something went wrong'
      redirect_to project_path(project)
    end
  end

  def edit
    @project = @condition.project
  end

  def update
    project = @condition.project
    if @condition.update(condition_params)
      flash[:success] = "condition was successfully updated"
      redirect_to project_path(project)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:name, :status, :initial_condition, :project_id)
  end

  def set_condition
    @condition = Condition.find(params[:id])
  end
end
