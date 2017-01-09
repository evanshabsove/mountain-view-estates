class OrderController < ApplicationController
  def index
    @inv_products = InventoryProduct.all
    @order_item = current_order.order_items.new
  end
end
