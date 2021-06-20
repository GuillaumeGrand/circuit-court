class Store < ApplicationRecord
  belongs_to :user
  has_many :product
  has_one_attached :photo
end
