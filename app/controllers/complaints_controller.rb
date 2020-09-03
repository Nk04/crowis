class ComplaintsController < ApplicationController
  before_action :set_complaints, only: [:edit, :update, :destroy]
  before_action :access_restrictions, only: [:edit, :update, :destroy]

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

  def show
    @complaints = Complaint.find(params[:id])
    @comment = Comment.new
    @comments = @complaints.comments.includes(:user).order('created_at DESC')
  end

  def edit
  end

  def update
    @complaints.update!(complaint_params)
    redirect_to complaint_path
  rescue StandardError
    render :edit
  end

  def destroy
    @complaints.destroy!
    redirect_to root_path
  rescue StandardError
    render :edit
  end

  private

  def complaint_params
    params.require(:complaint).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_complaints
    @complaints = Complaint.find(params[:id])
  end

  def access_restrictions
    redirect_to root_path if current_user.id !=  @complaints.user_id
  end
end
