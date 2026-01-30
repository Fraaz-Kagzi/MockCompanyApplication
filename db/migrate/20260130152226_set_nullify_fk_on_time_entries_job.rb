class SetNullifyFkOnTimeEntriesJob < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :time_entries, :jobs
    add_foreign_key :time_entries, :jobs, on_delete: :nullify
  end
end
