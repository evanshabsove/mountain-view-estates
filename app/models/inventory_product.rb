class InventoryProduct < ApplicationRecord
  has_many :order_items

  def self.search(search, inventory_code)
    if search
      up = search.upcase
      where('description LIKE ? AND inventory_code LIKE ?', "%#{up}%", inventory_code)
    else
      InventoryProduct.all
    end
  end

end
