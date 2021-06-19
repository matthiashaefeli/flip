class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]

  def index
    @contractors = Contractor.order(:name)
  end

  def new
    @contractor = Contractor.new
  end

  def create
    @contractor = Contractor.new(contractor_params)
    if @contractor.save
      flash[:success] = "contractor successfully created"
      redirect_to contractors_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @contractor.destroy
      flash[:success] = 'contractor was successfully deleted.'
      redirect_to contractors_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to contractors_path
    end
  end

  def update
    if @contractor.update(contractor_params)
      flash[:success] = "contractor was successfully updated"
      redirect_to contractors_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def contractor_params
    params.require(:contractor).permit(:name, :address, :telephone1, :telephone2, :telephone3, :status)
  end

  def set_contractor
    @contractor = Contractor.find(params[:id])
  end
end
