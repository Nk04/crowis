class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    redirect_to complaint_path(params[:complaint_id])
  rescue StandardError
    redirect_to complaint_path(params[:complaint_id])
  end
end

private

def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, complaint_id: params[:complaint_id])
end
