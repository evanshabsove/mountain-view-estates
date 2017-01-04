class OrderItem < ApplicationRecord
  belongs_to :inventory_product
  belongs_to :special_product
  belongs_to :order
end
