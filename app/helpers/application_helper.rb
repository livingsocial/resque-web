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
    puts "is #{name} current subtab? #{method(:current_subtab?)}"
    content_tag :li, link_to(name, "/#{current_tab}/#{name}"), :class => current_subtab?(name) ? "current" : nil
  end

  def current_subtab?(name)
    params[:id] == name.to_s
  end

  def pagination(options = {})
    start    = options[:start] || 1
    per_page = options[:per_page] || 20
    total    = options[:total] || 0
    return if total < per_page

    markup = ""

    if start - per_page >= 0
      markup << link_to(raw("&laquo; less"), params.merge(:start => start - per_page), :class => 'less')
    end

    if start + 20 <= total
      markup << link_to(raw("&raquo; more"), params.merge(:start => start + per_page), :class => 'more')
    end

    content_tag :p, raw(markup), :class => 'pagination'
  end
end
