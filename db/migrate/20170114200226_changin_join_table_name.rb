class ChanginJoinTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_special_products, :special_products_users
  end
end
