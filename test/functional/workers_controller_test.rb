require 'test_helper'

module ResqueWeb
  class WorkersControllerTest < ActionController::TestCase
    include ControllerTestHelpers

    setup do
      @routes = Engine.routes
    end

    describe "GET /index" do
      it "renders the index page" do
        visit(:index)
        assert_template :index
      end
    end

    describe "GET /show" do
      it "renders the show page" do
        visit(:show, id: "all")
        assert_template :show
      end
    end

  end
end
