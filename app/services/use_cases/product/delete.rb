module UseCases
    module Product
        class Delete
            def self.call(product, callbacks, repository = ProductRepository.new)
                destroy_photos(product)
                repository.delete(product)  ? callbacks[:success].call : callbacks[:error].call
            end

            def self.destroy_photos(product)  
                product.photos.each do |photo|
                    Cloudinary::Uploader.destroy(photo.key)
                end
            end
        end
    end
end