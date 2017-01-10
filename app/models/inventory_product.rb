class InventoryProduct < ApplicationRecord
  has_many :order_items

  def self.search(search)
    if search
      up = search.upcase
      where('description LIKE ?', "%#{up}%")
    else
      InventoryProduct.all
    end
  end

end
