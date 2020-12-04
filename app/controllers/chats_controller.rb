class ChatsController < ApplicationController
	def chat
	end

	def refresh
		respond_to do |format|
			msgs = Message.all
			format.json do
				render json: msgs.to_json
			end
		end
	end
end
