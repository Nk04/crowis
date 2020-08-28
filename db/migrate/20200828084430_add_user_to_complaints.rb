class AddUserToComplaints < ActiveRecord::Migration[6.0]
  def change
    add_reference :complaints, :user, null: false, foreign_key: true
  end
end
