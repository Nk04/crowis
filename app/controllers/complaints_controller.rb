class ComplaintsController < ApplicationController
  before_action :set_complaint
  def index
  end

  def new
  end

  def create
    Complaint.new(complaint_params)
    @complaints.save!
    redirect_to root_path
  rescue StandardError
    render :new

  private

  def set_complaint
    @complaints = Complaint.new
  end

  def complaint_params
    params.require(:complaint).paramit(:title, :text).merge(user_id: current_user.id)
  end
end
