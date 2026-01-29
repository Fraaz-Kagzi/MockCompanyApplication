class TimeEntry < ApplicationRecord
  belongs_to :timesheet
  belongs_to :job
end
