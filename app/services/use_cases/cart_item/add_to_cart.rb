module UseCases
    module CartItem
        class AddToCart
            def self.call(store_id, live_user, attrs, callbacks, repository = CartItemRepository.new)
                item = repository.new_entity(attrs)
                item.user = live_user
                repository.save(item) ? callbacks[:success].call(store_id) : callbacks[:success].call(store_id)
            end
        end
    end
end