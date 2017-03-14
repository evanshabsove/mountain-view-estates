class AdminController < ApplicationController
  before_filter :authorize_admin, only: :create

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_new_url
    else
      render "new"
      flash[:notice] = "Form is invalid"
    end
  end

  def new
    @users = User.search(params[:search])
    @selected_user = current_admin_user
    @user_product = UserProduct.new
    @special_products = SpecialProduct.search(params[:searchspecial], params[:product_code], params[:def_search], params[:inv_code])
    @inventory_products = InventoryProduct.search(params[:searchspecial], params[:product_code], params[:def_search], params[:inv_code])
  end

  def update_special
    @special_product = SpecialProduct.find(params[:id])
    @special_product.update_attributes(product_params_special)
    @special_products = SpecialProduct.all
    @inventory_products = InventoryProduct.all
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_all-products.html.erb', objects: [@special_products, @inventory_products], layout: false))} }
    end
  end

  def new_product
    @inventory_product = InventoryProduct.new
    @special_product = SpecialProduct.new
  end

  def update_inventory
    @inventory_product = InventoryProduct.find(params[:id])
    @inventory_product.update_attributes(product_params_inventory)
    @special_products = SpecialProduct.all
    @inventory_products = InventoryProduct.all
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_all-products.html.erb', objects: [@special_products, @inventory_products], layout: false))} }
    end
  end

  def delete_special
    @special_product = SpecialProduct.find(params[:id])
    @special_product.destroy
    @special_products = SpecialProduct.all
    @inventory_products = InventoryProduct.all
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_all-products.html.erb', objects: [@special_products, @inventory_products], layout: false))} }
    end
  end

  def delete_inventory
    @inventory_product = InventoryProduct.find(params[:id])
    @inventory_product.destroy
    @special_products = SpecialProduct.all
    @inventory_products = InventoryProduct.all
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_all-products.html.erb', objects: [@special_products, @inventory_products], layout: false))} }
    end
  end

  def products
    @special_products = SpecialProduct.all
    @inventory_products = InventoryProduct.all
  end

  def product_user
    @user = User.find(session[:user_id])
    @selected_user = @user
    if special_product_params["inventory_product_id"] == nil
      special_product_params["special_product_id"].each do |special_product|
        @user_product = UserProduct.new
        @user_product.user_id = @user.id
        @user_product.special_product_id = special_product.to_i
        @user_product.save
      end
    elsif special_product_params["special_product_id"] == nil
      special_product_params["inventory_product_id"].each do |inventory_product|
        @user_product = UserProduct.new
        @user_product.user_id = @user.id
        @user_product.inventory_product_id = inventory_product.to_i
        @user_product.save
      end
    else
      flash[:error]
    end
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_addedproducts.html.erb', objects: [@selected_user], layout: false))} }
    end
  end

  def selected_user
    @user = User.find(special_product_params["user_id"].to_i)
    session[:user_id] = @user.id
    respond_to do |format|
      format.html
      format.js
    end
    redirect_to admin_new_url
  end

  def delete_product
    @selected_user = current_admin_user
    if special_product_params["inventory_product_id"] == nil
      special_product_params["special_product_id"].each do |special_product|
        @user_product = UserProduct.where(user_id: @selected_user.id, special_product_id: special_product.to_i)
        @user_product.each do |user_product|
          user_product.destroy
        end
      end
    elsif special_product_params["special_product_id"] == nil
      special_product_params["inventory_product_id"].each do |inventory_product|
        @user_product = UserProduct.where(user_id: @selected_user.id, inventory_product_id: inventory_product.to_i)
        @user_product.each do |user_product|
          user_product.destroy
        end
      end
    else
      flash[:error]
    end
    redirect_to admin_new_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def special_product_params
    params.require(:user_product).permit(:user_id, special_product_id:[], inventory_product_id:[])
  end

  def product_params_special
    params.require(:special_product).permit(:inventory_code, :description, :product_code)
  end

  def product_params_inventory
    params.require(:inventory_product).permit(:inventory_code, :description, :product_code)
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
