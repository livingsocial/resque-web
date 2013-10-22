resque-web
==========
[![Build Status](https://travis-ci.org/resque/resque-web.png?branch=master)](https://travis-ci.org/resque/resque-web)
[![Dependency Status](https://gemnasium.com/resque/resque-web.png)](https://gemnasium.com/resque/resque-web)
[![Code Climate](https://codeclimate.com/github/resque/resque-web.png)](https://codeclimate.com/github/resque/resque-web)
[![Coverage Status](https://coveralls.io/repos/resque/resque-web/badge.png?branch=master)](https://coveralls.io/r/resque/resque-web)

A Rails-based frontend to the [Resque](https://github.com/resque/resque) job
queue system. This provides a similar interface to the existing Sinatra
application that comes bundled with Resque, but deploys like a Rails application
and leverages Rails conventions for factoring things like controllers, helpers,
and views.

More documentation coming soon!

## Starting
Resque web is built as a rails engine.

Add it to your gemfile.

```Ruby
gem 'resque-web', require: 'resque_web'
```

Mount it in your config/routes.rb.

```Ruby
require "resque_web"

MyApp::Application.routes.draw do
  mount ResqueWeb::Engine => "/resque_web"
end
```

If you need a non-default resque server, use this environment variable.

```
RAILS_RESQUE_REDIS=123.x.0.456:6712
```
## Security

You almost certainly want to limit access when using resque-web in production. Using [routes constraints](http://guides.rubyonrails.org/routing.html#request-based-constraints) is one way to achieve this:

```ruby
# config/routes.rb

resque_web_constraint = lambda { |request| request.remote_ip == '127.0.0.1' }
constraints resque_web_constraint do
  mount ResqueWeb::Engine => "/resque_web"
end

```

Another example of a route constraint using the current user when using Devise or another warden based authentication system:

```ruby
# config/routes.rb
resque_web_constraint = lambda do |request|
	current_user = request.env['warden'].user

	current_user.present? && current_user.respond_to?(:is_admin?) && current_user.is_admin?
end

constraints resque_web_constraint do
  mount ResqueWeb::Engine => "/resque_web"
end

```

## Screenshot

![Screenshot](http://i.imgur.com/LkNgl.png)
