source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'resque', :git => 'git://github.com/defunkt/resque.git', :branch => "1-x-stable"

group :test do
  gem 'minitest-spec-rails'
  gem 'minitest-spec-rails-tu-shim', :platforms => :ruby_18
  gem 'coveralls', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'twitter-bootstrap-rails'

  gem 'libv8',        '3.11.8.13', :platforms => :ruby
  gem 'therubyracer', '~> 0.11.4', :platforms => :ruby
  gem 'therubyrhino', '2.0.2',     :platforms => :jruby

  gem 'uglifier', '>= 1.0.3'
end
