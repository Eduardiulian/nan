require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    post loginp_url, params: { email: users(:one).email, password: "secret" }
  end

  test "should get chats list" do
    get chatlist_url
    assert_response :success
  end

end
