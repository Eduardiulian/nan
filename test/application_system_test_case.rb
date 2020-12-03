require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
	driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

	def login
		visit login_url

		fill_in 'Email', with: "test@gmail.com"
		fill_in 'Password', with: "123456"

		click_on 'Login'
	end
end
