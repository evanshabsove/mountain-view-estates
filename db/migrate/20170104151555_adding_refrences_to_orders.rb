class AddingRefrencesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_items, :special_produc
    add_reference :order_items, :inventory_product
    add_reference :order_items, :order
    add_reference :orders, :order_status
    add_reference :orders, :user
  end
end
