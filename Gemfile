source 'https://rubygems.org'

gemspec
gem 'rails', '~> 5.0.0'
gem 'resque', github: 'resque'

gem 'sqlite3', :platforms => :ruby
gem 'activerecord-jdbcsqlite3-adapter', github: 'jruby/activerecord-jdbc-adapter', branch: 'rails-5', :platforms => :jruby

group :development, :test do
  gem "dotenv-rails"
  gem "rdoc"
  gem 'listen', '~> 3.0.5'
end

group :test do
  gem 'minitest-spec-rails'
  gem 'coveralls', :require => false
  gem 'redcard'
  gem "mocha", :require => false
  gem 'rails-controller-testing'
end


gem 'uglifier', '>= 1.0.3'

gem 'libv8',        '~> 3.16.14.15', :platforms => :ruby
gem 'therubyracer', '~> 0.12.2',    :platforms => :ruby
gem 'therubyrhino', '2.0.4',        :platforms => :jruby

platforms :rbx do
  # These are the ruby standard library
  # dependencies and transitive dependencies.
  gem 'rubysl', '~> 2.0'
  gem 'racc'
  gem 'rubinius-profiler'
  gem 'rubinius-coverage'
end
