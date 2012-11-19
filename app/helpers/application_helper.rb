module ApplicationHelper
  def tabs
    %w(overview working failed queues workers stats)
  end

  def tab(name)
    raw "<li#{' class="current"' if current_tab?(name) }><a href=\"/#{name}\">#{name.capitalize}</a></li>"
  end

  def current_tab?(name)
    params[:controller] == name
  end
end
