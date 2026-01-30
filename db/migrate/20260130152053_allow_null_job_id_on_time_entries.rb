class AllowNullJobIdOnTimeEntries < ActiveRecord::Migration[8.1]
  def change
    change_column_null :time_entries, :job_id, true
  end
end
