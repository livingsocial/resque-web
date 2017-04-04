require 'resque'

# Previously, this initializer always set Resque.redis, and defaulted to '127.0.0.1:6379' if
# RAILS_RESQUE_REDIS was not set.

if ENV['RAILS_RESQUE_REDIS'].present?
  Resque.redis = ENV['RAILS_RESQUE_REDIS']
end
