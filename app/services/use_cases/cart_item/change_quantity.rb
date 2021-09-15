module UseCases
    module CartItem
        class ChangeQuantity
            def self.call(item, attrs, callbacks, repository = CartItemRepository.new)
                item.assign_attributes(attrs)
                repository.save(item) ? callbacks[:success].call : callbacks[:success].call
            end
        end
    end
end