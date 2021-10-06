class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :order_details
  has_one_attached :photo
end
