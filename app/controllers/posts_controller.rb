class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_post, except: [:index,:new,:create]

	#GET /posts
	def index
		#Todos los registros SELECT * FROM articles
  		if user_signed_in?
  			if current_user.is_admin?
  				@posts = Post.all.order(created_at: :desc)
  			else
  				@posts = current_user.posts.order(created_at: :desc)
  			end
  		else
  			@posts = Post.all.order(created_at: :desc)
  		end
		@allposts = Post.all
	end

	#GET /posts/:id
	def show
  		if user_signed_in?
  			if current_user.is_admin?
  				@posts = Post.all.order(created_at: :desc)
  			else
  				@posts = current_user.posts.order(created_at: :desc)
  			end
  		else
  			@posts = Post.all.order(created_at: :desc)
  		end
		@post.update_visits_count
		@comment = Comment.new
		@score = Score.new
		@average = current_user.posts.last.scores.average(:value)
		@scoreado = 0
	end

	#GET /posts/new
	def new
		if current_user.is_admin?
			redirect_to root_path
		else
			@post = Post.new
		end
	end

	def edit
		
	end

	#POST /posts
	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def destroy
		#elimina el post de la BD
		@post.destroy
		redirect_to posts_path
	end
	
	#PUT /posts/:id
	def update
		
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title,:body,:cover)
	end

end