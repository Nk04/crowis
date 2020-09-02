class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    redirect_to root_path
  rescue StandardError
    redirect_to root_path
  end
end

private

def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, complaint_id: params[:complaint_id])
end