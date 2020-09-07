class CreateEmpathies < ActiveRecord::Migration[6.0]
  def change
    create_table :empathies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :complaint, null: false, foreign_key: true
      t.timestamps
    end
  end
end
