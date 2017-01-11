class InventoryProduct < ApplicationRecord
  has_many :order_items

  def self.search(search, product_code)
    if search
      up = search.upcase
      where('description LIKE ? AND product_code = ?', "%#{up}%", product_code)
    else
      InventoryProduct.all
    end
  end

end
