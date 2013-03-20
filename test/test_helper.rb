require 'tooling/profiler/profiler' rescue nil
require 'coveralls'
Coveralls.wear! 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/spec'
require 'resque'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end
