require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    post loginp_url, params: { email: users(:one).email, password: "secret" }
    @message = messages(:one)
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { reciever: @message.reciever, sender: @message.sender, text: @message.text } }
    end
  end

end
