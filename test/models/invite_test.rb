require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not find random' do 
  	obj = Invite.find_by(sender: "qwebtmyyml")
  	assert obj.nil?
  end

  test 'should find fixture' do 
  	obj = Invite.find_by(sender: "mysender@mail.ru")
  	assert_equal false, obj.nil?
  end

  test 'should write' do
  	before = Invite.count()
  	obj = Invite.new()
    obj.sender = "testtest@gmail.com"
    obj.reciever = "testtest1@gmail.com"
    obj.accepted = "false"
    obj.save!
    after = Invite.count()
    assert_equal before + 1, after
  end
end
