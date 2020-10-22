class Complaint < ApplicationRecord
  # association
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :empathy,  dependent: :destroy

  # validation
  with_options presence: true do
    validates :title
    validates :text
  end

  def self.search(search)
    if search != ""
      Complaint.where('text LIKE(?)', "%#{search}%")
    else
      Complaint.all
    end
  end
end
