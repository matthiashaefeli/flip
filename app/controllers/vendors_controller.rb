class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.order(:name)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash[:success] = "Vendor successfully created"
      redirect_to vendors_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @vendor.destroy
      flash[:success] = 'Vendor was successfully deleted.'
      redirect_to vendors_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to vendors_path
    end
  end

  def update
    if @vendor.update(vendor_params)
      flash[:success] = "Vendor was successfully updated"
      redirect_to vendors_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :address, :telephone1, :telephone2, :telephone3)
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end
end
