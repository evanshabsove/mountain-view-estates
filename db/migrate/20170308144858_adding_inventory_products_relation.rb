class AddingInventoryProductsRelation < ActiveRecord::Migration[5.0]
  def change
    add_column :user_products, :inventory_product_id, :integer
  end
end
