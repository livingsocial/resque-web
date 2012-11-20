module ApplicationHelper
  def tabs
    %w(overview working failures queues workers stats)
  end

  def tab(name)
    content_tag :li, link_to(name.capitalize, "/#{name}"), :class => current_tab?(name) ? "current" : nil
  end

  def current_tab
    params[:controller]
  end

  def current_tab?(name)
    params[:controller] == name.to_s
  end

  attr_reader :subtabs

  def subtab(name)
    content_tag :li, link_to(name, "/#{current_tab}/#{name}"), :class => current_subtab?(name) ? "current" : nil
  end

  def current_subtab?(name)
    params[:action] == name.to_s
  end
end
