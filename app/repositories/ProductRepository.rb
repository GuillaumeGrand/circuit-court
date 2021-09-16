class ProductRepository
    def all_products(store)
        store.products.includes([photos_attachments: :blob])
    end
    
    def find(id)
        Product.includes([photos_attachments: :blob]).find(id)
    end
    
    def new_entity(attrs = nil)
        Product.new(attrs)
    end

    def save(product)
        product.save
    end

    def delete(product)
        product.destroy
    end

    def dashboard_index(store)
        store.products.includes([photos_attachments: :blob])
    end
end