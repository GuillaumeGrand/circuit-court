module Create
  class  UniqueShoppingSession < ApplicationService
    attr_reader :user, :product

    def initialize(user:, product:)
      @user = user
      @product = product
      @store = find_store
    end

    def call
      find_shopping_session(store).empty? ? create_shopping_session : ""
    end

      private

    def create_shopping_session
      shopping_session = ShoppingSession.new(total: 0)
      shopping_session.user = @user
      shopping_session.store_id = @product.store.id
      shopping_session.save!
    end

    def find_store
      product.store
    end

    def find_shopping_session(store)
      ShoppingSession.find_unique_shopping_session(store.id, @user.id)
    end
  end
end
