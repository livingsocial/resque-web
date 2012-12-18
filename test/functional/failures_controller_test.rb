require 'test_helper'

class FailuresControllerTest < ActionController::TestCase
  test "destroys failures" do
    post 'destroy'
    assert_redirected_to failures_path
  end
end
