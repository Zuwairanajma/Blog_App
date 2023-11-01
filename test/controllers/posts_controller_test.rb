require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get root_url
        assert_response :not_acceptable
      end
end
