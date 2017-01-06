class OrderController < ApplicationController
  def index
    @inv_products = InventoryProduct.all
  end
end
