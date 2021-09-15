class CartItemRepository
    def finding_cart_items(user)
        CartItemDecorator.decorate_collection(CartItem.find_cart_items(user))
    end

    def new_entity(attrs = nil)
        CartItem.new(attrs)
    end

    def save(cart_item)
        cart_item.save
    end

    def delete(cart_item)
        cart_item.destroy
    end
end