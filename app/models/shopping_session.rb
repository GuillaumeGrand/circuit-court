class ShoppingSession < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  scope :find_unique_shopping_session, ->(store_id,  user_id) {where(store_id: store_id , user_id: user_id)}
end
