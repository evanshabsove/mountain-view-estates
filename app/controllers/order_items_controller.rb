class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    session[:order_id] = @order.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to order_index_url, notice: 'Item was successfully added.' }
        format.js   { }
        format.json { render order_index_url, status: :created, location: @order_item }
      else
        format.html { render order_index_url }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_items = @order.order_items
    if @order_item.update_attributes(order_item_params)
      if @order_item.quantity == 0
        @order_item.destroy
        redirect_to cart_path
      else
        redirect_to cart_path
      end
    else
      redirect_to cart_path
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  def order_item_params
     params.require(:order_item).permit(:quantity, :inventory_product_id, :special_product_id)
  end
end
