class AddUserToEmpathies < ActiveRecord::Migration[6.0]
  def change
    add_reference :empathies, :user, null: false, foreign_key: true
  end
end
