class WelcomeController < ApplicationController

  	def index
  		if user_signed_in? 
  			@posts = current_user.posts
  		end
  	end
end
