class CreateTimesheets < ActiveRecord::Migration[8.1]
  def change
    create_table :timesheets do |t|
      t.references :user, null: false, foreign_key: true
      t.date :week_start
      t.string :status

      t.timestamps
    end
  end
end
