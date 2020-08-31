class ComplaintsController < ApplicationController
  before_action :set_complaints, only: [:edit, :show]

  def index
    @complaints = Complaint.order('created_at DESC')
  end

  def new
    @complaints = Complaint.new
  end

  def create
    @complaints = Complaint.new(complaint_params)
    @complaints.save!
    redirect_to root_path
  rescue StandardError
    render :new
  end

  def edit
  end

  def show
  end

  private

  def complaint_params
    params.require(:complaint).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_complaints
    @complaints = Complaint.find(params[:id])
  end
end
