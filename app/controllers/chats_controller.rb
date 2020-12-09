class ChatsController < ApplicationController
	def chat
		# @target_email = params[:target_email]
		# logger.info("~log_target: " + @target_email)
	end

	def refresh
		@target_email = params[:target_email]
	    logger.info("~log_target_refresh: " + @target_email.to_s)
	    logger.info("~log_target_refresh: " + current_user.email)
	    #msgs = Message.all
	     msgs = Message.where("(reciever = '#{current_user.email}' \
      and sender = '#{params[:target_email]}') \
      or (sender = '#{current_user.email}'  \
      and reciever = '#{params[:target_email]}')")
		respond_to do |format|
			format.json do
				render json: msgs.to_json
			end
		end
	end
end
