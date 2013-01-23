require 'test_helper'

class RetryControllerTest < ActionController::TestCase
  let(:exception) { RuntimeError.new("some exception") }
  let(:worker)    { Resque::Worker.new(:test) }
  let(:queue)     { "test_queue" }
  let(:payload)   { {'class' => Object, 'args' => 3} }

  let(:failure_id) do
    Resque::Failure.create(
      :exception => exception,
      :worker    => worker,
      :queue     => queue,
      :payload   => payload
    )
  end

  def retried?(failure_id)
    failure = Resque::Failure.all(failure_id - 1)
    !!(failure && failure['retried_at'])
  end

  it "retries individual jobs" do
    retried?(failure_id).wont_equal true

    post 'create', :failure_id => queue, :id => failure_id
    assert_redirected_to failure_path(queue)

    retried?(failure_id).must_equal true
  end

  it "retries all jobs" do
    retried?(failure_id).must_equal false

    post 'create', :failure_id => 'all'
    assert_redirected_to failures_path

    retried?(failure_id).must_equal true
  end
end
