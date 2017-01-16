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
    @user = User.last
    @user_product = UserProduct.new
    @special_products = SpecialProduct.paginate(:page => params[:page], :per_page => 10)
  end

  def product_user
    @user = User.last
    @user_product = UserProduct.new(special_product_params)
    raise 'hit'
    if @user_product.save
      redirect_to admin_index_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def special_product_params
    params.require(:user_product).permit(:special_product_id, :user_id)
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
