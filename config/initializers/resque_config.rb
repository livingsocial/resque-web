config = ENV.fetch("RAILS_RESQUE_REDIS", "127.0.0.1:6379")
p "Starting resque-web against Resque server - #{config}"
Resque.redis = config
