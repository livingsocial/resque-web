require 'test_helper'

class RetryControllerTest < ActionController::TestCase
  it "should retry jobs" do
    failure_id = 1
    post 'create', :failure_id => failure_id
    assert_redirected_to failure_path(1)
  end
end
