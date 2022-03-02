class CheckoutsController < ApplicationController
  before_action :authenticate_consumer
  def create
    user_id = current_user.id
    store_id = params[:store_id]

    items = CartItem.find_user_orders_in_store(user_id, store_id)

    checkout = Stripe::CreateCheckout.call(items, base_url, store_id)
    redirect_to checkout.url
  end

  def success
    store_id = params[:store_id]
    user_id = current_user.id
    total = params[:total]
    items = CartItem.find_user_orders_in_store(user_id, store_id)
    order_detail = OrderDetail.new(user_id: user_id, store_id: store_id, order_status: "pending", total: total)
    order_detail.save
    items.each do |item|
      OrderItem.new(product_id: item.product_id, order_detail_id: order_detail.id, quantity: item.quantity).save
    end
    items.destroy_all
  end
end
