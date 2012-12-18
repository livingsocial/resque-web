require 'test_helper'

class FailuresControllerTest < ActionController::TestCase
  let(:exception) { RuntimeError.new("some exception") }
  let(:worker)    { Resque::Worker.new(:test) }
  let(:queue)     { "test_queue" }
  let(:payload)   { Hash.new('class' => Object, 'args' => 3) }

  it "destroys failures" do
    Resque::Failure.create(
      :exception => exception,
      :worker    => worker,
      :queue     => queue,
      :payload   => payload
    )
    Resque::Failure.count.wont_equal 0

    post 'destroy'
    Resque::Failure.count.must_equal 0
    assert_redirected_to failures_path
  end
end
