class CartItemsController < ApplicationController
  # before_action :authenticate_consumer
  before_action :set_item, only: [:update, :destroy]

  def index
    @items = current_user.present? ? 
      repo.finding_cart_items(current_user) :
      find_items_in_cookies
  end

  def create
    success = ->(store_id) { redirect_to store_products_path(store_id), notice: 'cart item has been updated' }
    error = ->(store_id) { redirect_to store_products_path(store_id), notice: 'error' }

    current_user.present? ?
      UseCases::CartItem::AddToCart.call(params[:store_id], current_user, cart_params, success: success, error: error) :
      set_up_cookies(cart_params)
  end

  def update
    success = -> { redirect_to cart_items_path }
    error = -> { redirect_to root_path }
    
    current_user.present? ?
    UseCases::CartItem::ChangeQuantity.call(@item, cart_params, success: success, error: error) :
    update_quantity_cookie(params[:quantity], params[:id])
  end

  def destroy
    success = -> {redirect_to cart_items_path }
    error = -> { redirect_to root_path }

    current_user.present? ?
      UseCases::CartItem::DeleteItem.call(@item, success: success, error: error) :
      delete_cookie_item(params[:id])
  end

  private

  def cart_params
    params.permit(:quantity, :product_id, :user_id, :store_id)
  end

  def repo
    @repo ||= CartItemRepository.new
  end

  def set_item
    if current_user.present?
      @item = current_user.cart_items.find(params[:id])
    end
  end

  def set_up_cookies(attrs)
    if cookies[:cart] == nil
      cookies[:cart] = JSON.generate({ 1 => [quantity: attrs["quantity"], 
                                            product_id:  attrs["product_id"], 
                                            store_id: attrs["store_id"]]})
    else
      h = JSON.parse cookies[:cart]
      b = h.size + 1
      h[b] =  [quantity: attrs["quantity"], 
              product_id:  attrs["product_id"], 
              store_id: attrs["store_id"]]
      cookies[:cart] = JSON.generate(h)
    end
    redirect_to root_path
  end

  def find_items_in_cookies
    product = cookies[:cart] ? cookie_processing(cookies[:cart]) : [] 
  end

  def cookie_processing(cookie)
    final_array = []
    items = JSON.parse cookie
    a = items.group_by {|k,v| v[0]["store_id"].itself}
    a.each do |k, v|
      final_array << v
    end
  end

  def delete_cookie_item(cookie_product_id)
    a = JSON.parse cookies[:cart]
    b = a.reject! { |k,v| v[0]["product_id"] == cookie_product_id }
    cookies[:cart] = JSON.generate(b)
    redirect_to cart_items_path
  end

  def update_quantity_cookie(quantity, product_id)
    a = JSON.parse cookies[:cart]
    p "1" * 150
    p quantity
    p product_id
    p a
    p "1" * 150
    b = a.each { |k,v|  v[0]["product_id"] == product_id ? v[0]["quantity"] = quantity : ""}
    cookies[:cart] = JSON.generate(b)
    p "2" * 150
    p b
    p "2" * 150
  end
end
