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
end
