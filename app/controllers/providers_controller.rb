class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.order(:name)
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      flash[:success] = "Provider successfully created"
      redirect_to providers_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    if @provider.destroy
      flash[:success] = 'Provider was successfully deleted.'
      redirect_to providers_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to providers_path
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :address, :telephone1, :telephone2, :telephone3, :status)
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end
end
