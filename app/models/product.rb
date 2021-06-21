class Product < ApplicationRecord
  belongs_to :store
  has_many :product_categories
  has_many :discounts
  has_many :product_inventories
  has_many_attached :photos
end
