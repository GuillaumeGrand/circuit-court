class CartsItemsController < ApplicationController
  before_action :authenticate_consumer

  def cart

  end

  def add_product_to_cart
    product = Product.find(params[:product_id])
    Create::UniqueShoppingSession.call(current_user, product)
    shopping_session = ShoppingSession.find_unique_shopping_session(product.store.id, current_user.id)
    order = CartItem.new(cart_params)
    order.product_id = product.id
    order.shopping_session_id = shopping_session[0].id
    order.save!
  end

  private

  def cart_params
    params.permit(:quantity)
  end
end
