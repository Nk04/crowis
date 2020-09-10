class Empathy < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :complaint

  # validation
end
