require 'test_helper'

module ResqueWeb
  class QueuesControllerTest < ActionController::TestCase
    include ControllerTestHelpers

    setup do
      @routes = Engine.routes
      Resque.push(queue_name, class: 'ExampleJob')
    end

    teardown do
      Resque.remove_queue(queue_name)
    end

    let(:queue_name) { 'example_queue' }

    describe "GET /index" do
      it "renders the index page" do
        visit(:index)
        assert_template :index
      end
    end

    describe "GET /show" do
      it "renders the show page" do
        visit(:show, id: queue_name)
        assert_template :show
      end
    end

    describe "DELETE /destroy" do
      it "deletes queues" do
        visit(:destroy, {id: queue_name}, method: :delete)
        assert_redirected_to queues_path
      end

      it "deletes queues" do
        visit(:destroy, {id: queue_name}, method: :delete)
        Resque.queues.include?(queue_name).wont_equal true
      end
    end
  end
end
