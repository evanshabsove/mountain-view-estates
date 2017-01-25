module ApplicationHelper
  def css_slug
    "#{params[:action]}"
  end
end
