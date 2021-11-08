class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :order_details
  has_many :product_categories, :through => :products
  has_one_attached :photo
end
