# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_active(text, path = {})
    class_name = ''
    if(params[:controller] == path[:controller] && params[:action] == path[:action])
      class_name = 'active'
    end
    return link_to(text, path, :class => class_name, :title => text)
  end
end