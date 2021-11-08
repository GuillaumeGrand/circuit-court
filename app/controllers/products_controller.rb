class ProductsController < ApplicationController
  before_action :authenticate_retailer, only: [:new, :create, :dashboard_index, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_store, exept: [:update, :destroy]
  before_action :set_categories, only: [:index, :show]
  
  
  def index
    category = repo.category_param(@store, params[:category])
    @category = repo.all_products(@store, category)
  end

  def show; end

  def new
    @product = repo.new_entity
    @product.build_product_category
  end

  def create
    success = -> (store) { redirect_to store_products_path(store) }
    error = -> { redirect_to root_path }

    UseCases::Product::Create.call(@store, 
                                          product_params, 
                                          success: success, 
                                          error: error)
  end

  def dashboard_index
    @products = repo.dashboard_index(@store)
  end

  def edit; end

  def update
    success = -> (product) { redirect_to dashboard_path(product.store) }
    error = -> { redirect_to root_path }

    UseCases::Product::Update.call(product_params['photos'], 
                                          @product, product_params, 
                                          success: success, 
                                          error: error)
  end

  def destroy
    success = -> { redirect_to root_path }
    error = -> { redirect_to root_path }

    UseCases::Product::Delete.call(@product, success: success, error: error)
  end

  private

  def repo
    @repo ||= ProductRepository.new
  end

  def product_params
    params.require(:product).permit(:name, 
                                    :desc,
                                    :price_cents, 
                                    photos: [], 
                                    :product_category_attributes => [:id, :name])
  end

  def set_store
    @store = Store.find(params[:store_id] || current_user.store.id)
  end

  def set_product
    @product = repo.find(params[:id])
  end

  def set_categories
    @btn_categories = repo.find_uniq_category(@store)
  end
end
