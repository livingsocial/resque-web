require 'test_helper'

class FailuresHelperTest < ActionView::TestCase
  include ResqueWeb::FailuresHelper

  test "failure_queue_name without params queue" do
    assert_equal failure_queue_name, "Failed"
  end

  test "failure_queue_name with a params queue" do
    params[:queue] = "QueueName"
    assert_equal failure_queue_name, "QueueName"
  end

end
