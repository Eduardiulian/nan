# frozen_string_literal: true

# implements main controller
class AutomorphsController < ApplicationController
	skip_before_action :require_auth, only: :switch
	def input
		redirect_to invitelist_url
	end

	def view
	end

	def switch
		logger.info("~log: switch locale")
		if I18n.default_locale == :en
			I18n.default_locale = :ru
		else
			I18n.default_locale = :en
		end
		redirect_to invitelist_url 
		#redirect_to :back
	end
end