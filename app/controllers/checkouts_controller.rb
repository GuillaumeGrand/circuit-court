class CheckoutsController < ApplicationController
  def create
    user_id = current_user.id
    store_id = params[:store_id]

    items = CartItem.all.find_user_orders_in_store(user_id, store_id)

    Stripe::CreateCheckout.call(items, base_url, store_id)
  end
end
