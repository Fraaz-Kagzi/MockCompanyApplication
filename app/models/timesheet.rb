class Timesheet < ApplicationRecord
  belongs_to :user
  has_many :time_entries, dependent: :destroy
end
