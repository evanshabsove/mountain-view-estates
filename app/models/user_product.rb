class UserProduct < ApplicationRecord
  belongs_to :user
  belongs_to :special_product
end
