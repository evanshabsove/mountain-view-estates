class UserProduct < ApplicationRecord
  belongs_to :user
  belongs_to :special_product
  belongs_to :inventory_product
end
