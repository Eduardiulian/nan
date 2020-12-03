require 'test_helper'

class CachedResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # 
  test 'should error on non unique record' do
    instance1 = CachedResult.new()
    instance1.input = "7"
    instance1.result = "[[7]]"
    instance1.save!
    instance2 = instance1.dup
    assert_raise do 
    	instance2.save!
    end
  end

  test 'should not find random' do 
  	obj = CachedResult.find_by(input: "webeewrb")
  	assert obj.nil?
  end

  # test 'should not find fixture' do 
  # 	obj = CachedResult.find_by(input: "MyString")
  # 	assert_equal false, obj.nil?
  # end

  test 'should write and read' do
  	obj = CachedResult.new()
    obj.input = "4"
    obj.result = "[[4]]"
    obj.save!
    obj2 = CachedResult.find_by(input: "4")
    assert_equal "[[4]]", obj2.result
  end

  test 'should filter invalid' do
  	obj = CachedResult.new()
    obj.input = "ghuohuohiuh"
    obj.result = "[[4]]"
    assert_equal false, obj.valid?
  end
end
