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
    @special_products = SpecialProduct.search(params[:searchspecial])
  end

  def product_user
    @user = User.find(session[:user_id])
    @selected_user = @user
    special_product_params["special_product_id"].each do |special_product|
      @user_product = UserProduct.new
      @user_product.user_id = @user.id
      @user_product.special_product_id = special_product.to_i
      @user_product.save
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
  end

  def delete_product
    @selected_user = current_admin_user
    special_product_params["special_product_id"].each do |special_product|
      @user_product = UserProduct.where(user_id: @selected_user.id, special_product_id: special_product.to_i)
      @user_product.each do |user_product|
        user_product.destroy
      end
    end
    redirect_to admin_new_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def special_product_params
    params.require(:user_product).permit(:user_id, special_product_id:[])
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
