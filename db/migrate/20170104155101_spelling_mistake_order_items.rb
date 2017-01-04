class SpellingMistakeOrderItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :order_items, :special_produc_id, :special_product_id
  end
end
