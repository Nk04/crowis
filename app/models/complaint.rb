class Complaint < ApplicationRecord
  # association
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :empathy,  dependent: :destroy
end
