class EmpathiesController < ApplicationController
  before_action :set_complaint

  def create
    @empathy = Empathy.create(user_id: current_user.id, complaint_id: @complaint.id)
  end

  def destroy
    @empathy = current_user.Empathy.find_by(complaint_id: @complaint.id)
    @empathy.destroy
  end
end

private

def set_complaint
  @complaint = Complaint.find(:complaint_id)
end