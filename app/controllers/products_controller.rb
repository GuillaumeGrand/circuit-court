class ProductsController < ApplicationController
  
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products.includes([photos_attachments: :blob])
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

  def dashboard_index
    @store = Store.find(params[:store_id])
    @products = @store.products.includes([photos_attachments: :blob])
  end

  def edit
    @store = Store.find(current_user.store.id)
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if product_params['photos'].nil? == false
      @product.photos.each do |photo|
        Cloudinary::Uploader.destroy(photo.key)
      end
    end
    @product.update(product_params)
    redirect_to store_path(@product.store.id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :desc, :price_cents, photos: [])
  end
end
