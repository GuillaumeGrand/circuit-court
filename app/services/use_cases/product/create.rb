module UseCases
    module Product
        class Create
            def self.call(store, attrs, callbacks, repository = ProductRepository.new)
                product = repository.new_entity(attrs)
                product.store = store
                repository.save(product) ? callbacks[:success].call(store) : callbacks[:error].call
            end
        end
    end
end