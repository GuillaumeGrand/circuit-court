class StoreRepository
    def all
        Store.includes([photo_attachment: :blob]).all
    end
    
    def find(id)
        Store.includes([photos_attachments: :blob]).find(id)
    end
    
    def new_entity(attrs = nil)
        Store.new(attrs)
    end

    def save(store)
        store.save
    end

end