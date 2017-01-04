class RemoveCategories < ActiveRecord::Migration[5.0]
  def change
    remove_reference :special_products, :categorie
    remove_reference :inventory_products, :categorie
    drop_table :categories
    rename_table :user_special_parts, :user_special_products
  end
end
