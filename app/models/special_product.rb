class SpecialProduct < ApplicationRecord
  has_many :user_products
  has_many :users, through: :user_products
  has_many :order_items

  def self.search(search)
   if search
     up = search.upcase
     where('description LIKE ?', "%#{up}%")
   else
     SpecialProduct.all
   end
 end
end
