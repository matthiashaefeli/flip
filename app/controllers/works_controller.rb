class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def new
    @condition = Condition.find(params[:condition])
    @work = Work.new
  end

  def edit
    @condition = @work.condition
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Work successfully created"
      redirect_to @work.condition
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    condition = @work.condition
    if @work.update(work_params)
      flash[:success] = "work was successfully updated"
      redirect_to condition_path(condition)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    condition = @work.condition
    if @work.destroy
      flash[:success] = 'condtition was successfully deleted.'
      redirect_to condition_path(condition)
    else
      flash[:error] = 'Something went wrong'
      redirect_to condition_path(condition)
    end
  end

  private

  def work_params
    params.require(:work).permit(:name, :contractor_id, :status, :condition_id)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
