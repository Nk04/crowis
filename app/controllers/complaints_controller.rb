class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.new
  end
end
