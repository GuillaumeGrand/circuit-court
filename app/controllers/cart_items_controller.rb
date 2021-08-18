class CartItemsController < ApplicationController
  before_action :authenticate_consumer

  def index
    @stores = CartItemDecorator.decorate_collection(CartItem.find_cart_items(current_user))
  end

  def create
    order = CartItem.new(cart_params)
    order.save!
  end

  def update
    product_quantity = params['quantity']
    cart = CartItem.find(params["id"])
    cart.quantity = product_quantity
    cart.save!

    redirect_to :back
  end

  def destroy
    cart = CartItem.find(params[:id])
    cart.destroy

    redirect_to cart_items_path
  end

  def cart_params
    params.permit(:quantity, :product_id, :user_id, :store_id)
  end
end
