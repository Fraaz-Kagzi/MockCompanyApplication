class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :employee_number
      t.string :department

      t.timestamps
    end
  end
end
