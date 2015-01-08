class WelcomeController < ApplicationController
	def index
		@user1_email = params[:user1_email]
		@user2_email = params[:user2_email]
		@message = params[:message]
	end
end
