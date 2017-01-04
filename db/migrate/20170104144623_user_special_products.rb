class UserSpecialProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_special_parts, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :special_product, index: true
    end

    remove_reference :special_products, :user
    remove_reference :users, :special_product
  end
end
