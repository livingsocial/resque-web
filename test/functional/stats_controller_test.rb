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

    describe "GET /resque" do
      it "renders the resque page" do
        visit(:resque)
        assert_template :resque
      end
    end

    describe "GET /resque.json" do
      it "renders the resque page" do
        visit(:resque, format: 'json')
        assert_equal response.body, Hash[Resque.info.sort].to_json
      end
    end

    describe "GET /redis" do
      it "renders the redis page" do
        visit(:redis)
        assert_template :redis
      end
    end

    describe "GET /redis.json" do
      it "renders the redis page" do
        expected = Resque.redis.info
        Resque.redis.stubs(:info).returns(expected)
        visit(:redis, format: 'json')
        assert_equal response.body, Hash[expected.sort].to_json
      end
    end

    describe "GET /keys" do
      it "renders the keys page" do
        visit(:keys)
        assert_template :keys
      end
    end

    describe "GET /keys/:id" do
      it "renders the keys page" do
        visit(:keys, id: "failed")
        assert_template :key
      end
    end

    describe "GET /keys.json" do
      it "renders the keys page" do
        visit(:keys, format: 'json')
        assert_equal response.body, Resque.keys.sort.to_json
      end
    end

  end
end
