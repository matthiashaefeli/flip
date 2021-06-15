class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy]

  def index
    @realtors = Realtor.order(:name)
  end

  def new
    @realtor = Realtor.new
  end

  def create
    @realtor = Realtor.new(realtor_params)
    if @realtor.save
      flash[:success] = "Realtor successfully created"
      redirect_to realtors_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @realtor.destroy
      flash[:success] = 'Realtor was successfully deleted.'
      redirect_to realtors_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to realtors_path
    end
  end

  def update
    if @realtor.update(realtor_params)
      flash[:success] = "Vendor was successfully updated"
      redirect_to realtors_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def realtor_params
    params.require(:realtor).permit(:name, :address, :telephone1, :telephone2, :telephone3, :company)
  end

  def set_realtor
    @realtor = Realtor.find(params[:id])
  end
end
