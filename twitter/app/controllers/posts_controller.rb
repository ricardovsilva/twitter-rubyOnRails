class PostsController < ApplicationController
	def index
		@posts = Post.order(:created_at)
		respond_to do |format|
			format.html
		end
	end

	def create
		@post = Post.create(:message => params[:message])
		respond_to do |format|
			if @post.save
				byebug
				#format.html { redirect_to posts_path }
				format.js { render 'create'}
			else
				flash[:notice] = "Message failed to save."
				format.html { redirect_to posts_path }
			end
		end
	end
end
			

