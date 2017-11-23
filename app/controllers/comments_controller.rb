class CommentsController < ApplicationController

	def new
		@todo = Todo.find(params[:todo_id])
		@comment = Comment.new
	end

	def create
		@todo = Todo.find(params[:todo_id])
		@comment = @todo.comments.create(comment_params)
		redirect_to todo_path(@todo)
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end
end