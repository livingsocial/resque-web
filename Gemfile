source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gemspec

gem 'rails', '~> 5.0', '>= 5.0.2'
gem 'uglifier'
gem 'sqlite3'

group :development, :test do
  gem 'dotenv-rails'
end

group :test do
  gem 'minitest-spec-rails'
  gem 'coveralls', require: false
  gem 'redcard'
  gem 'mocha', require: false
  gem 'rails-controller-testing'
end
