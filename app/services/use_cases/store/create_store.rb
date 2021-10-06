module UseCases
    module Store
        class CreateStore < UseCases::Base
            def self.call(user, attrs, callbacks, repository = StoreRepository.new)
                store = repository.new_entity(attrs)
                store.user = user

                repository.save(store) ? callbacks[:success].call : callbacks[:error].call
            end
        end
    end
end