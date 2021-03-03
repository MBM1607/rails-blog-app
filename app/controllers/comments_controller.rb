class CommentsController < ApplicationController

	before_action :authenticate_user!, only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comments_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		if current_user.id == @comment.user_id
			@comment.destroy
		else
			flash[:alert] = "You are not authorized to delete this comment!"
		end
		redirect_to article_path(@article)

	end

	private
		def comments_params
			val = params.require(:comment).permit(:body, :status)
			val[:user_id] = current_user.id
			val
		end
end
