module UseCases
    module Store
        class UpdateStore < Base
            def self.call(params, store, attrs, callbacks, repository = StoreRepository.new)
                destroy_photos(params, store)
                store.assign_attributes(attrs)
                repository.save(store) ? callbacks[:success].call(store) : 
                                         callbacks[:error].call
            end

            def self.destroy_photos(params, store)
                if params.nil? == false
                    store.photos.each do |photo|
                        Cloudinary::Uploader.destroy(photo.key)
                    end
                end
            end
        end
    end
end