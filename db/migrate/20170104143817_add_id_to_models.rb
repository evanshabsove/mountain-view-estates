class AddIdToModels < ActiveRecord::Migration[5.0]
  def change
    add_reference :inventory_products, :categorie
    add_reference :special_products, :categorie
    add_reference :special_products, :user
    add_reference :users, :special_product
  end
end
