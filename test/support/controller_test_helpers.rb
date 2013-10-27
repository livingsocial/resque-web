module ControllerTestHelpers
  def visit(action, params = {}, options = {})
    method = options.delete(:method) || :get

    user = ENV["RESQUE_WEB_HTTP_BASIC_AUTH_USER"]
    password = ENV["RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD"]

    if options[:auth] == :disabled
      ENV["RESQUE_WEB_HTTP_BASIC_AUTH_USER"] = nil
      ENV["RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD"] = nil
    else
      request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(
        options[:user] || user, options[:password] || password
      ) unless options[:auth] == false
    end

    send(method, action, params)

    ENV["RESQUE_WEB_HTTP_BASIC_AUTH_USER"] = user
    ENV["RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD"] = password
  end
end
