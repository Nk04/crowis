class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :complaint
end
