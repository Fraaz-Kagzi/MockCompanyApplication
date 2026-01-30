class CreateIncidents < ActiveRecord::Migration[8.1]
  def change
    create_table :incidents do |t|
      t.references :reported_by, null: false, foreign_key: { to_table: :users }
      t.references :job, null: true, foreign_key: true
      t.date :occurred_on
      t.string :location
      t.text :description
      t.integer :severity
      t.integer :status
      t.timestamps
    end
  end
end
