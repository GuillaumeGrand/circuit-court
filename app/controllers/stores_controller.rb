class StoresController < ApplicationController
  before_action :authenticate_retailer, except: [:index]
  before_action :set_store, only: [:edit, :update]

  def index
    @stores = repo.all
  end

  def new
    @store = repo.new_entity
  end

  def create
    success = -> { redirect_to dashboard_path }
    error = -> { redirect_to root_path }

    UseCases::Store::CreateStore.call(current_user, 
                                      store_params, 
                                      success: success, 
                                      error: error)
  end

  def edit; end

  def update
    success = -> (store) { redirect_to dashboard_path(store) }
    error = -> { redirect_to root_path }

    UseCases::Store::UpdateStore.call(store_params['photos'], 
                                          @store, store_params, 
                                          success: success, 
                                          error: error)
  end

  private

  def set_store
    @store = Store.find(params[:store_id] || current_user.store.id)
  end

  def repo
    @repo ||= StoreRepository.new
  end

  def store_params
    params.require(:store).permit(:presentation, 
                                  :name, 
                                  :photo)
  end
end
