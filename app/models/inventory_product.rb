class InventoryProduct < ApplicationRecord
  has_many :order_items

  def self.search(search, product_code, def_search)
    if search
      up = search.upcase

      where('description LIKE ? AND product_code = ? AND description LIKE ?', "%#{up}%", product_code, "%#{def_search}%")
    else
      InventoryProduct.all
    end
  end

end
