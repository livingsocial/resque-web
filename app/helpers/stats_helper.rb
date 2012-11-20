module StatsHelper
  def resque_info
    Resque.info.sort_by { |i| i[0].to_s }
  end

  def redis_info
    Resque.redis.info.to_a.sort_by { |i| i[0].to_s }
  end
end
