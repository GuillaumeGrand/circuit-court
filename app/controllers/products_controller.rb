class ProductsController < ApplicationController
  before_action :authenticate_retailer, only: [:new, :create, :dashboard_index, :edit, :update]
  before_action :set_store, only: [:index, :new, :create, :dashboard_index, :edit]
  before_action :set_product, only: [:show, :edit, :update]
  
  def index
    @products = repo.all_products(@store)
  end

  def show; end

  def new
    @product = repo.new_entity
  end

  def create
    success = -> (store) { redirect_to store_products_path(store) }
    error = -> { redirect_to root_path }

    UseCases::Product::CreateProduct.call(@store, product_params, success: success, error: error)
  end

  def dashboard_index
    @products = repo.dashboard_index(@store)
  end

  def edit; end

  def update
    success = -> (product) { redirect_to dashboard_path(product.store) }
    error = -> { redirect_to root_path }

    UseCases::Product::UpdateProduct.call(product_params['photos'], @product, product_params, success: success, error: error)
  end

  private

  def repo
    @repo ||= ProductRepository.new
  end

  def product_params
    params.require(:product).permit(:name, :desc, :price_cents, photos: [])
  end

  def set_store
    @store = Store.find(params[:store_id] || current_user.store.id)
  end

  def set_product
    @product = repo.find(params[:id])
  end
end
