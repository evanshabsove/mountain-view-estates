class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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
end
