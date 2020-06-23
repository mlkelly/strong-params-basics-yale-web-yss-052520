class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	# 	started with:
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
		# second refactor:
		# @post = Post.new(params.require(:post).permit(:title, :description))
		# @post.save
		# redirect_to post_path(@post)
		@post = Post.new(post_params(:title, :description))
		@post.save
		redirect_to post_path(@post)
	end

	def update
	#   started with:
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
		# second refactor:
		# @post = Post.find(params[:id])
		# @post.update(params.require(:post).permit(:title))
		# redirect_to post_path(@post)
		@post = Post.find(params[:id])
  		@post.update(post_params(:title))
  		redirect_to post_path(@post)
		
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
	# We pass the permitted fields in as *args;
	# this keeps `post_params` pretty dry while
	# still allowing slightly different behavior
	# depending on the controller action. This
	# should come after the other methods
 

	# def post_params
	# 	params.require(:post).permit(:title, :description)
	# end
	
	def post_params(*args)
		params.require(:post).permit(*args)
	end

end
