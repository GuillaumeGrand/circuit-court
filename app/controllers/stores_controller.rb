class StoresController < ApplicationController
  before_action :authenticate_retailer, except: [:index]

  def index
    @stores = repo.all
  end

  def new
    @store = repo.new_entity
  end

  def create
    success = -> { redirect_to dashboard_path }
    error = -> { redirect_to root_path }

    UseCases::Store::CreateStore.call(current_user, store_params, success: success, error: error)
  end

  private

  def repo
    @repo ||= StoreRepository.new
  end

  def store_params
    params.require(:store).permit(:presentation, :name, :photo)
  end
end
