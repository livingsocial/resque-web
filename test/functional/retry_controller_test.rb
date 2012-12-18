require 'test_helper'

class RetryControllerTest < ActionController::TestCase
  let(:exception) { RuntimeError.new("some exception") }
  let(:worker)    { Resque::Worker.new(:test) }
  let(:queue)     { "test_queue" }
  let(:payload)   { Hash.new('class' => Object, 'args' => 3) }

  it "should retry jobs" do
     failure_id = Resque::Failure.create(
      :exception => exception,
      :worker    => worker,
      :queue     => queue,
      :payload   => payload
    )

    post 'create', :failure_id => failure_id
    assert_redirected_to failure_path(failure_id)
  end
end
