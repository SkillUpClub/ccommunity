class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user,   only: [:edit, :destroy]
	before_action :set_post, only: [:create, :destroy]

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to @post
		end
	end

	def destroy
		if @comment.destroy
			redirect_to @post
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

  def set_post
  	@post = Post.friendly.find(params[:post_id])
  end
end
