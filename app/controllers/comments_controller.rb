class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    redirect_to root_path
  rescue StandardError
    redirect_to "/complaints/10"
  end
end

private

def comment_params
  params.permit(:comment).merge(user_id: current_user.id, complaint_id: params[:complaint_id])
end