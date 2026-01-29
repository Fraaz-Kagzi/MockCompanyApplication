class CreateTimeEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :time_entries do |t|
      t.references :timesheet, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.date :work_date
      t.decimal :hours
      t.text :notes

      t.timestamps
    end
  end
end
