class Product < ApplicationRecord
  belongs_to :store
  has_one :product_category
  has_many :order_items
  has_many :discounts
  has_many :product_inventories
  has_many_attached :photos

  accepts_nested_attributes_for :product_category

  monetize :price_cents

  def product_price
    product.price_cents
  end

  def product_photos
    product.photos
  end
end
