class WelcomeController < ApplicationController

  	def index
  		if user_signed_in?
  			if current_user.is_admin?
  				@posts = Post.all.order(created_at: :desc)
  			else
  				@posts = current_user.posts.order(created_at: :desc)
          @post = current_user.posts.last
          @comment = Comment.new
          @score = Score.new
          if current_user.posts.last.nil?
            @average = -1
          else
            @average = current_user.posts.last.scores.average(:value)
          end
          @scoreado = 0
  			end
  		else
  			@posts = Post.all.order(created_at: :desc)
  		end
  	end
end
