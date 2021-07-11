class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :store
  has_one :user_address
  has_many :shopping_session
  has_many :user_payments
  has_many :order_details
end
