module Create
  class  UniqueShoppingSession < ApplicationService
    def initialize(user, product)
      @user = user
      @product = product
    end

    def call
      store = @product.store
      shopping_session = ShoppingSession.find_unique_shopping_session(store.id, @user.id)
      if shopping_session.empty?
        @shopping_session = ShoppingSession.new(total: 0)
        @shopping_session.user = @user
        @shopping_session.store_id = @product.store.id
        @shopping_session.save!
      end
    end
  end
end
