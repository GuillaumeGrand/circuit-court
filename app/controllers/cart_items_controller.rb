class CartItemsController < ApplicationController
  before_action :authenticate_consumer
  before_action :set_item, only: [:update, :destroy]

  def index
    @items = repo.finding_cart_items(current_user)
  end

  def create
    success = ->(store_id) { redirect_to store_products_path(store_id), notice: 'cart item has been updated' }
    error = ->(store_id) { redirect_to store_products_path(store_id), notice: 'error' }

    UseCases::CartItem::AddToCart.call(params[:store_id], current_user, cart_params, success: success, error: error)
  end

  def update
    success = -> { redirect_to cart_items_path }
    error = -> { redirect_to root_path }
    
    UseCases::CartItem::ChangeQuantity.call(@item, cart_params, success: success, error: error)
  end

  def destroy
    success = -> {redirect_to cart_items_path }
    error = -> { redirect_to root_path }

    UseCases::CartItem::DeleteItem.call(@item, success: success, error: error)
  end

  private

  def cart_params
    params.permit(:quantity, :product_id, :user_id, :store_id)
  end

  def repo
    @repo ||= CartItemRepository.new
  end

  def set_item
    @item = current_user.cart_items.find(params[:id])
  end
end
