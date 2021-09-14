class CheckoutsController < ApplicationController
  def create
    user_id = current_user.id
    store_id = params[:store_id]

    items = CartItem.find_user_orders_in_store(user_id, store_id)

    checkout = Stripe::CreateCheckout.call(items, base_url, store_id)
    redirect_to checkout.url
  end

  def success
    
  end
end
