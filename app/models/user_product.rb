class UserProduct < ApplicationRecord
  belongs_to :user
  belongs_to :inventory_product, optional: true
  belongs_to :special_product, optional: true
end
