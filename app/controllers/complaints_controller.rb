class ComplaintsController < ApplicationController
  before_action :set_complaint
  def index
  end

  def new
  end

  private

  def set_complaint
    @complaints = Complaint.new
  end
end
