module ApplicationHelper
  def css_slug
    if "#{params[:controller]}" == "devise/sessions"
      return "#{params[:action]}"
    else
      return "#{params[:controller]}-#{params[:action]}"
    end
  end
end
