require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should error on non unique record' do
    instance1 = User.new()
    instance1.email = "testtest@gmail.com"
    instance1.password = "qwerty"
    instance1.save!
    instance2 = instance1.dup
    assert_raise do 
    	instance2.save!
    end
  end

  test 'should not find random' do 
  	obj = User.find_by(email: "webeewrb")
  	assert obj.nil?
  end

  test 'should find fixture' do 
  	obj = User.find_by(email: "myuser@mail.ru")
  	assert_equal false, obj.nil?
  end

  test 'should write' do
  	before = User.count()
  	obj = User.new()
    obj.email = "testtest@gmail.com"
    obj.password = "pass"
    obj.save!
    after = User.count()
    assert_equal before + 1, after
  end
end
