class EmpathiesController < ApplicationController
  before_action :set_complaints
  def create
    @empathy = Empathy.new(user_id: current_user.id, complaint_id: params[:complaint_id])
    @empathy.save
  end

  def destroy
    @empathy = current_user.empathy.find_by(user_id: current_user.id, complaint_id: params[:complaint_id])
    @empathy.destroy
  end

  private

  def set_complaints
    @complaint = Complaint.find(params[:complaint_id])
  end
end
