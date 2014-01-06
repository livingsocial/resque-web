require 'twitter-bootstrap-rails'
require 'jquery-rails'

module ResqueWeb
  class Engine < ::Rails::Engine
    isolate_namespace ResqueWeb
  end
  module Plugins
    def self.plugins
      self.constants.map{|m| self.const_get(m)}
    end
  end
end
