class LendersController < ApplicationController
  before_action :set_lender, only: [:show, :edit, :update, :destroy]

  def index
    @lenders = Lender.order(:name)
  end

  def new
    @lender = Lender.new
  end

  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      flash[:success] = "Lender successfully created"
      redirect_to lenders_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @lender.destroy
      flash[:success] = 'Lender was successfully deleted.'
      redirect_to lenders_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to lenders_path
    end
  end

  def update
    if @lender.update(lender_params)
      flash[:success] = "Lender was successfully updated"
      redirect_to lenders_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def lender_params
    params.require(:lender).permit(:name, :address, :telephone1, :telephone2, :telephone3, :ltype)
  end

  def set_lender
    @lender = Lender.find(params[:id])
  end
end
