class CreateSpecialProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :special_products do |t|
      t.string :inventory_code
      t.string :description
      t.string :stock
      t.string :product_code

      t.timestamps
    end
  end
end
