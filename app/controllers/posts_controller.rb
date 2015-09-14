class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_post, except: [:index,:new,:create]

	#GET /posts
	def index
		#Todos los registros SELECT * FROM articles
		@posts = Post.all
	end

	#GET /posts/:id
	def show
		@post.update_visits_count
		@comment = Comment.new
	end

	#GET /posts/new
	def new
		@post = Post.new
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