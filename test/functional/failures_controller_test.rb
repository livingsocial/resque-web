require 'test_helper'

class FailuresControllerTest < ActionController::TestCase

  describe "GET /failures" do
    it "renders the index page" do
      get :index
      assert_template :index
    end
  end

  context "DELETE /failures/:id" do
    it "deletes the failure" do
      Resque::Failure.expects(:remove).with('123')
      delete :destroy, :id=>123
      assert_redirected_to failures_path
    end
  end

  context "DELETE /failures/destroy_all" do
    it "deletes all failures" do
      Resque::Failure.expects(:clear).with('failed')
      delete :destroy_all
      assert_redirected_to failures_path
    end
  end

  context "PUT /failures/:id/retry" do
    it "retries the failure" do
      Resque::Failure.expects(:requeue).with('123')
      put :retry,:id=>123
      assert_redirected_to failures_path
    end
  end

  context "PUT /failures/retry_all" do
    it "retries all failures using requeue if no queue specified" do
      Resque::Failure.stubs(:count).returns(2)
      Resque::Failure.stubs(:requeue).returns(true)
      Resque::Failure.expects(:requeue).with(0)
      Resque::Failure.expects(:requeue).with(1)
      put :retry_all
      assert_redirected_to failures_path
    end
    it "retries all failures using requeue_queue if queue specified" do
      Resque::Failure.expects(:requeue_queue).with('myqueue')
      put :retry_all,:queue=>"myqueue"
      assert_redirected_to failures_path(:queue=>'myqueue')
    end
  end

end
