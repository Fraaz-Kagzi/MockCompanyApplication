class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :status
      t.date :scheduled_for

      t.timestamps
    end
  end
end
