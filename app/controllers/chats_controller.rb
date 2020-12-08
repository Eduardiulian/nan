class ChatsController < ApplicationController
	def chat
		# @target_email = params[:target_email]
		# logger.info("~log_target: " + @target_email)
	end

	def refresh
		@target_email = params[:target_email]
	    logger.info("~log_target_refresh: " + @target_email.to_s)
	    msgs = Message.all
		respond_to do |format|
			format.json do
				render json: msgs.to_json
			end
		end
	end
end
