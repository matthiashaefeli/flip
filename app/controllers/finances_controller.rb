class FinancesController < ApplicationController
  before_action :set_finance, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project])
    @finance = Finance.new
  end

  def create
    @finance = Finance.new(finance_params)
    if @finance.save
      flash[:success] = "#{@finance.name} successfully created"
      redirect_to project_path(@finance.project)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @project = @finance.project
  end

  def update
    if @finance.update(finance_params)
      flash[:success] = "finance was successfully updated"
      redirect_to project_path(@finance.project)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    project = @finance.project
    if @finance.destroy
      flash[:success] = 'finance was successfully deleted.'
      redirect_to project_path(project)
    else
      flash[:error] = 'Something went wrong'
      redirect_to project_path(project)
    end
  end

  private

  def finance_params
    params.require(:finance).permit(:name, :ftype, :project_id)
  end

  def set_finance
    @finance = Finance.find(params[:id])
  end
end
