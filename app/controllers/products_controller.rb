class ProductsController < ApplicationController
  before_action :authenticate_retailer, except: [:index, :show]

  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  def show
    @product = Product.includes([photos_attachments: :blob]).find(params[:id])
  end

  def new
    @store = Store.find(current_user.store.id)
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    @store = Store.find(params[:store_id])
    product.store = @store
    product.save
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :desc, :price, photos: [])
  end
end
