require 'test_helper'

module ResqueWeb

  class OverviewControllerTest < ActionController::TestCase
    include ControllerTestHelpers

    setup do
      @routes = Engine.routes
    end

    describe "GET /" do
      describe "when HTTP Basic Authentication is enabled" do
        describe "and the currect username and password are supplied " do
          it "should grant me access" do
            visit(:show)
            assert_response :ok
          end
        end

        describe "and the username and password are not supplied" do
          it "should deny me access" do
            visit(:show, {}, :auth => false)
            assert_response :unauthorized
          end
        end
      end

      describe "when HTTP Basic Authentication is disabled" do
        it "should grant me access" do
          visit(:show, {}, :auth => :disabled)
          assert_response :ok
        end
      end
    end
  end
end
