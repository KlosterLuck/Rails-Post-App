class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :destroy]
	before_action :require_same_employer, only: [:edit, :update, :destroy]
	before_filter :authenticate_employer!, only: [:new, :edit, :update, :destroy]

	def index
		#@posts = Post.all #WORKING ORIGINAL
		#Search - From post params.require. Compares name with params TESTING
		@posts = Post.all
  			if params[:search]
    			@posts = Post.search(params[:search]).order("created_at DESC")
  			else
    			@posts = Post.all.order('created_at DESC')
  			end
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.new(post_params)
		@post.employer = current_employer

		if @post.save
			flash[:notice] = "Post was succesfully created"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def update
		
		if @post.update(post_params)
			flash[:notice] = "Post was succesfully updated"
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post was deleted"
		redirect_to posts_path
	end

	private

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :description, jobtype_ids: [])
		end



		def require_same_employer
			if current_employer !=@post.employer and !current_employer.try(:admin?)
				flash[:danger] = "You can only edit or delete your own post"
				#redirect_to root_path
				redirect_to (:back)
			end
		end

end