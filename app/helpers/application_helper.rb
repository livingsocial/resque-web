module ApplicationHelper
  def tabs
    %w(overview working failed queues workers stats)
  end

  def tab(name)
    raw "<li><a href=\"/#{name}\">#{name.capitalize}</a></li>"
  end
end
