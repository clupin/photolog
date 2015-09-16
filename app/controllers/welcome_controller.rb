class WelcomeController < ApplicationController

  	def index
  		if user_signed_in?
  			if current_user.is_admin?
  				@posts = Post.all.order(created_at: :desc)
  			else
  				@posts = current_user.posts.order(created_at: :desc)
  			end
  		else
  			@posts = Post.all.order(created_at: :desc)
  		end
  	end
end
