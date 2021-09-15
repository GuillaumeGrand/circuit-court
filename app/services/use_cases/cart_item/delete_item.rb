module UseCases
    module CartItem
        class DeleteItem
            def self.call(item, callbacks, repository = CartItemRepository.new)
                item.destroy ? callbacks[:success].call : callbacks[:success].call
            end
        end
    end
end