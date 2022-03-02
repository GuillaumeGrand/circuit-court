module CartItemsHelper
  def total_items(store)
    total = 0
    store[1].each do |product|
      total += (product_cents(product)) * product_quantity(product)
    end
    total
  end

  def product_cents(product)
    current_user.present? ? product.product.price_cents : cookies_product(product).price_cents
  end

  def product_quantity(product)
    current_user.present? ? product.quantity : product[1][0]["quantity"].to_i
  end

  def store_name(store)
    current_user.present? ?
      store[1].first.store.name :
      cookies_store_name(store)
  end

  def cookies_store_name(store)
    b = store.flatten
    s = b.select { |x| x.class == Hash}
    store_obj = Store.find(s[0]["store_id"].to_i)
    store_obj.name
  end

  def fetch_product_obj(product)
    current_user.present? ?
      product :
      cookies_product(product)
  end

  def cookies_product(product)
    Product.find(product[1][0]["product_id"])
  end

  def product_photo(product)
    current_user.present? ? product.product.photos[0].key : product.photos[0].key
  end

  def product_photo_present?(product)
    current_user.present? ? product.product.photos.present? : product.photos.present?
  end

  def product_name(product)
    current_user.present? ? product.product.name : product.name
  end

  def product_price(product)
    current_user.present? ? product.product.price_cents : product.price_cents
  end

  def store_id(store)
    current_user.present? ? store[1][0].store_id : store[1][0][1][0]["store_id"]
  end

  def update_product_quantity(product, store)
    current_user.present? ? db_update(product) : cookie_update(product, store)
  end

  def db_update(product)
    simple_form_for product do |f|
      f.input :quantity, collection: 1..5, selected: product.quantity, label: false , :input_html => { :class => 'select_quantity' }
    end
  end

  def cookie_update(product, store)
      form_with do |f|
        
        f.select :cookie_quantity,  [1,2,3,4], selected: cookie_quantity(product, store)
      end 
  end

  def product_inventories(product)
    max = product.product_inventories
    a = []
    b = 1
    max.time do
      a << b
      b =+ 1
    end
  end

  def cookie_quantity(product, store)
    product_id = product.id.to_s
    store[1].each do |k,v|
      break if v[0].has_key?(product_id)
        return v[0]["quantity"]
    end
  end
end 