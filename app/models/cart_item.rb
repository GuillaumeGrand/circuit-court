class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :store

  scope :find_user_cart, -> (user) { where(user_id: user.id).includes(:store, [product: [photos_attachments: :blob]]) }
  scope :order_by_create, -> { order('created_at DESC') }
  scope :group_by_store, -> { group_by(&:store_id) }

  def self.find_cart_items(user)
    find_user_cart(user).order_by_create.group_by_store
  end
end
