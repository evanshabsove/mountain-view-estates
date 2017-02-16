class OrderController < ApplicationController
  def index
    @inv_products = InventoryProduct.search(params[:search], params[:product_code], params[:def_search])
    @order_item = current_order.order_items.new
    @special_products = current_user.special_products.all
  end

  def update
    @order = current_order
    @order.order_status_id = 4
    @order.save
    redirect_to root_path
  end

end
