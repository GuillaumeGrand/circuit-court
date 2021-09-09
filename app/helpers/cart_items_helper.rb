module CartItemsHelper
  def total_items(store)
    total = 0
    store[1].each do |product|
      total += (product.product.price_cents) * product.quantity
    end
    total
  end
end
