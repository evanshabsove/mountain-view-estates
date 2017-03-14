class OrderController < ApplicationController
  def index
    @inv_products = current_user.inventory_products.search(params[:search], params[:product_code], params[:def_search], params[:inv_code])
    @order_item = current_order.order_items.new
    @special_products = current_user.special_products.search(params[:search], params[:product_code], params[:def_search], params[:inv_code])
    @clearence_products = InventoryProduct.all
  end

  def items
    @inv_products = InventoryProduct.search(params[:search], params[:product_code], params[:def_search], params[:inv_code])
    @special_products = current_user.special_products.search(params[:search], params[:product_code], params[:def_search], params[:inv_code])
    @order_item = current_order.order_items.new
  end

  def update
    @order = current_order
    @order.order_status_id = 4
    @order.order_items.each do |order_item|
      added = false
      if order_item.inventory_product == nil
        special_product_users = order_item.special_product.users
      else
        inventory_product_users = order_item.inventory_product.users
      end
      # if inventory_product_users == nil
      #   special_product_users.each do |special_product_user|
      #     if special_product_user.id == current_user.id
      #       added = true
      #     end
      #   end
      #   if added == false
      #     @user_product = UserProduct.new
      #     @user_product.user_id = current_user.id
      #     @user_product.special_product_id = special_product.to_i
      #             raise 'hit'
      #     @user_product.save
      #   end
      if special_product_users == nil
        inventory_product_users.each do |inventory_product_user|
          if inventory_product_user.id == current_user.id
            added = true
          end
        end
        if added == false
          @user_product = UserProduct.new
          @user_product.user_id = current_user.id
          @user_product.inventory_product_id = order_item.inventory_product.id
          @user_product.save
        end
      end
    end
    @order.save
    redirect_to root_path
  end

end
