$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resque_web/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resque-web"
  s.version     = ResqueWeb::VERSION
  s.authors     = ["Tony Arcieri"]
  s.email       = ["tony.arcieri@gmail.com"]
  s.homepage    = "https://github.com/resque/resque-web"
  s.summary     = "Rails-based Resque web interface"
  s.description = "A Rails-based frontend to the Resque job queue system."
  s.licenses    = ['MIT']

  s.files = Dir["{app,config,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "resque"
  s.add_dependency 'twitter-bootstrap-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'
end
