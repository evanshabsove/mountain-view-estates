class SpecialProduct < ApplicationRecord
  has_many :user_products
  has_many :users, through: :user_products
  has_many :order_items
end
