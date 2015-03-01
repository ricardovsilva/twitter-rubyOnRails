class PostsController < ApplicationController
	def index
		@posts = Post.order('created_at desc')
		#respond_to :html
	end

	def create
		@post = Post.create(:message => params[:message], :user => current_user)
		respond_to do |format|
			if @post.save
				format.html { redirect_to posts_path }
				format.js
			else
				flash[:notice] = "Message failed to save."
				format.html { redirect_to posts_path }
			end
		end
	end
end
			

