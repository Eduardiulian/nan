require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    post loginp_url, params: { email: users(:one).email, password: "secret" }
    @invite = invites(:one)
  end

  test "should get invites list" do
    get invitelist_url
    assert_response :success
  end

  test "should create invite" do
    assert_difference('Invite.count') do
      post invites_url, params: { invite: { accepted: @invite.accepted, reciever: @invite.reciever, sender: @invite.sender} }
    end
   end
end
