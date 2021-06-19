class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def new
    @condition = Condition.find(params[:condition])
    @work = Work.new
  end

  def create
    binding.pry
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Work successfully created"
      redirect_to @work.condition
    else
      flash[:error] = "Something went wrong"
      render 'new'
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
