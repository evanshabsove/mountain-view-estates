class OrderItem < ApplicationRecord
  belongs_to :inventory_product, optional: true
  belongs_to :special_product, optional: true
  belongs_to :order
end
