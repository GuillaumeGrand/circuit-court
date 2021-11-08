class ProductRepository
    def all_products(store, category)
        store.product_categories.where(name: category).includes(product: [photos_attachments: :blob])
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

    def category_param(store, category)
        category || store.product_categories.first.name
    end

    def find_uniq_category(store)
        store.product_categories.uniq { |s| s.name }
    end
end