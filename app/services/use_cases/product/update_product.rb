module UseCases
    module Product
        class UpdateProduct
            def self.call(params_photos, product, attrs, callbacks, repository = ProductRepository.new)
                destroy_photos(params_photos, product)
                product.assign_attributes(attrs)
                repository.save(product) ? callbacks[:success].call(product) : callbacks[:error].call
            end

            def self.destroy_photos(params_photos, product)
                if params_photos.nil? == false
                    product.photos.each do |photo|
                        Cloudinary::Uploader.destroy(photo.key)
                    end
                end
            end
        end
    end
end