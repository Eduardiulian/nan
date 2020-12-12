require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not error on non unique record' do
    instance1 = Message.new()
    instance1.sender = "testtest@gmail.com"
    instance1.reciever = "testtest1@gmail.com"
    instance1.text = "qwerty"
    instance1.save!
    instance2 = instance1.dup
    assert instance2.save
  end

  test 'should not find random' do 
  	obj = Message.find_by(sender: "qwebtmyyml")
  	assert obj.nil?
  end

  test 'should find fixture' do 
  	obj = Message.find_by(sender: "sender@mail.ru")
  	assert_equal false, obj.nil?
  end

  test 'should write' do
  	before = Message.count()
  	obj = Message.new()
    obj.sender = "testtest@gmail.com"
    obj.reciever = "testtest1@gmail.com"
    obj.text = "qwerty"
    obj.save!
    after = Message.count()
    assert_equal before + 1, after
  end
end
