class WelcomeController < ApplicationController

  	def index
  		if user_signed_in?
  			if current_user.is_admin?
  				@posts = Post.all.order(created_at: :desc)
  				@cant = Post.all.size
  			else
  				@posts = current_user.posts.order(created_at: :desc)
  				if current_user.posts.size > 0
  					@cant = current_user.posts.size-1
  					@plast = Post.last
  				else
  					@cant = 0
  				end
  			end
  		else
  			@posts = Post.all.order(created_at: :desc)
  			@cant = Post.all.size
  		end
  	end
end
