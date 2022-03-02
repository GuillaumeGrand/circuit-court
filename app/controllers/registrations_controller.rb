class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    save_cart_cookie
    resource.user_type == "retailer" ?
      new_retailer_identification_path :
      new_customer_identification_path
  end

  def after_sign_in_path_for(resource)
    save_cart_cookie
  end

  def save_cart_cookie
    if cookies[:cart].nil? == false
      cookie = JSON.parse cookies[:cart]
      cookie.each do |k,v|
        item = CartItem.new(quantity: v[0]["quantity"], 
                            product_id: v[0]["product_id"], 
                            user_id: current_user.id, 
                            store_id: v[0]["store_id"])
        item.save
      end
    end
  end
end
