class SpecialProduct < ApplicationRecord
  has_many :user_products
  has_many :users, through: :user_products
  has_many :order_items

  def self.search(search, product_code, def_search, inv_code)
    if search
      up = search.upcase

      full_up = "#{search} #{def_search}".upcase

      # search is nil
      if search == ""
        if def_search == nil
          where('product_code = ?', product_code)
        else
          where('product_code = ? AND description LIKE ?', product_code, "%#{def_search}%")
        end
      # if product code is nil
      elsif product_code == nil
        where('description LIKE ?', "%#{up}%")

      # if both are filled
      else
        if def_search == nil
          where('description LIKE ? AND product_code = ?', "%#{up}%", product_code)
        else
          where('description LIKE ? AND product_code = ? OR description LIKE ?', "%#{up}%", product_code, "%#{def_search}%")
        end
      end
    # if I am searching inventory code (only from admin page)
    elsif search == nil
      inv_up = "#{inv_code}".upcase
      where('inventory_code LIKE ?', "%#{inv_up}%")
    # default if errors
    else
      SpecialProduct.all
    end
  end
end
