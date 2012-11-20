module StatsHelper
  def resque_info
    Resque.info.sort_by { |i| i[0].to_s }
  end

  def redis_info
    Resque.redis.info.to_a.sort_by { |i| i[0].to_s }
  end

  def key_size(key)
    case Resque.redis.type(key)
    when 'none'
      0
    when 'list'
      Resque.redis.llen(key)
    when 'set'
      Resque.redis.scard(key)
    when 'string'
      Resque.redis.get(key).length
    when 'zset'
      Resque.redis.zcard(key)
    end
  end
end
