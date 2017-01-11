class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin
      return admin_index_url
    else
      return order_index_url
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return root_path
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def current_order
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
      if order.order_status_id == 4
        @order = Order.new
        @order.user = current_user
        @order.save
        return @order
      else
        return order
      end
    else
      @order = Order.new
      @order.user = current_user
      @order.save
      return @order
    end
  end

end
