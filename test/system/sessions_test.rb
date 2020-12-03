require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase
	test 'truth' do 
		:login
		assert true
	end 

	test 'should not login user with invalid credentials' do
		visit login_url

		fill_in 'Email', with: "ugiy"
		fill_in 'Password', with: "gygyuu"
		click_on 'Login'

		assert_text 'Email or password is invalid'
	end


  test 'register and count' do
    login = "testCount@mail.ru"
    password = "testpass"

    visit signup_url


    fill_in 'Email', with: login
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Create User'

    assert_text 'Sessions#new'


    fill_in 'Email', with: login
    fill_in 'Password', with: password
    click_on 'Login'

    assert_text 'input'

    fill_in 'search_range', with: 4
    click_on 'Output result'

    assert_text '4'
    assert_text 'longest sequence:'


    # click_on 'Logout'

    # assert_text 'Login'
  end

  test 'register login and logout' do
  	login = "testCount@mail.ru"
    password = "testpass"

    visit signup_url


    fill_in 'Email', with: login
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Create User'

    assert_text 'Sessions#new'


    fill_in 'Email', with: login
    fill_in 'Password', with: password
    click_on 'Login'

    assert_text 'input'

    click_on 'Logout'
    assert_text 'Login'
  end




end