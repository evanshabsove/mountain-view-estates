class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if @user.admin
      redirect_to admin_home
    else
      redirect_to order_home
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    redirect_to user_session
  end

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
