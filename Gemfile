source 'https://rubygems.org'

gemspec
gem 'rails', '~> 4.0.3'
gem 'resque', :git => 'https://github.com/resque/resque.git', :branch => "1-x-stable"

gem 'sqlite3', :platforms => :ruby
gem 'activerecord-jdbcsqlite3-adapter', :platforms => :jruby

group :development, :test do
  gem "dotenv-rails"
  gem "rdoc"
end

group :test do
  gem 'minitest-spec-rails', "~> 4.7.6"
  gem 'coveralls', :require => false
  gem 'redcard'
  gem "mocha", :require => false
end


gem 'uglifier', '>= 1.0.3'

gem 'libv8',        '~> 3.16.14.3', :platforms => :ruby
gem 'therubyracer', '~> 0.12.1',    :platforms => :ruby
gem 'therubyrhino', '2.0.2',        :platforms => :jruby

platforms :rbx do
  # These are the ruby standard library
  # dependencies and transitive dependencies.
  gem 'rubysl', '~> 2.0'
  gem 'racc'
  gem 'rubinius-profiler'
  gem 'rubinius-coverage'
end
