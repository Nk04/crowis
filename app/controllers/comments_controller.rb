class CommentsController < ApplicationController
  comment = Comment.create(comment_params)
  redirect_to "/complaints/#{comment.complaint.id}"

  private

  def comment_params
    params.require(:comment).premit(:text).marge(user_id: current_user.id, complaint_id: params[:complaint_id])
  end
end