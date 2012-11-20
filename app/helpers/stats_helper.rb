module StatsHelper
  def resque_info
    Resque.info.sort_by { |i| i[0].to_s }
  end
end
