module ApplicationHelper
  def tabs
    %w(overview working failed queues workers stats)
  end

  def tab(name)
    content_tag :li, link_to(name.capitalize, "/#{name}"), :class => current_tab?(name) ? "current" : nil
  end

  def current_tab?(name)
    params[:controller] == name
  end
end
