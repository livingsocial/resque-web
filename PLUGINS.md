Plugins
=======

Here is an example of how to write a plugin for the web interface, taken from
resque-history.

Create an engine like you normally would, but define it under the namespace
`ResqueWeb::Plugins::MyPlugin`. Also define `self.engine_path` so ResqueWeb
can mount your engine.

```Ruby
module ResqueWeb::Plugins::ResqueHistory
  class Engine < Rails::Engine
    # isolate or not?
    isolate_namespace ResqueWeb::Plugins::ResqueHistory
  end
  def self.engine_path
    "/history"
  end
end
```

ResqueWeb will look for code defined under this namespace and do special things
with it, like mounting it as an engine automatically!

It will also add more tabs if you define `self.tabs`.

```Ruby
module ResqueWeb::Plugins::ResqueHistory
  class Engine < Rails::Engine
    # isolate or not?
    isolate_namespace ResqueWeb::Plugins::ResqueHistory
  end
  def self.tabs
    [{'history' => Engine.app.url_helpers.history_path}]
  end
end
```
