require 'test_helper'

class RetryControllerTest < ActionController::TestCase
  let(:exception) { RuntimeError.new("some exception") }
  let(:worker)    { Resque::Worker.new(:test) }
  let(:queue)     { "test_queue" }
  let(:payload)   { Hash.new('class' => Object, 'args' => 3) }

  let(:failure_id) do
    Resque::Failure.create(
      :exception => exception,
      :worker    => worker,
      :queue     => queue,
      :payload   => payload
    )
  end

  it "retries individual jobs" do
    post 'create', :failure_id => failure_id
    assert_redirected_to failure_path(failure_id)
  end

  it "retries all jobs" do
    post 'create', :failure_id => 'all'
    assert_redirected_to failures_path
  end
end
