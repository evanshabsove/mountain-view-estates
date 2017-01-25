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
    @user_product = UserProduct.new
    @special_products = SpecialProduct.search(params[:searchspecial])
  end

  def product_user
    @user = User.last
    special_product_params["special_product_id"].each do |special_product|
      @user_product = UserProduct.new
      @user_product.user_id = special_product_params["user_id"].to_i
      @user_product.special_product_id = special_product.to_i
      @user_product.save
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
