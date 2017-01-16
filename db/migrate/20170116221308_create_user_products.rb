class CreateUserProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_products do |t|
      t.integer :user_id
      t.integer :special_product_id
      t.timestamps
    end

    drop_table :special_products_users
  end
end
