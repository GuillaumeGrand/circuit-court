module CartItemsHelper
  def total_items(store)
    total = 0
    store[1].each do |product|
      total += (product.product_price) * product.quantity
    end
    total
  end
end
