require 'test_helper'

module ResqueWeb
  class StatsControllerTest < ActionController::TestCase
    include ControllerTestHelpers

    setup do
      @routes = Engine.routes
    end

    describe "GET /index" do
      it "redirects to resque" do
        visit(:index)
        assert_redirected_to action: "resque"
      end
    end

  end
end
