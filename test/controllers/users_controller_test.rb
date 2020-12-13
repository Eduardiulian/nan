require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: "t@mail.com", password: 'secret', password_confirmation: 'secret' } }
    end
  end

end
