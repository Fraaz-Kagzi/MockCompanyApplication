class User < ApplicationRecord
  has_many :assigned_jobs, class_name: "Job", foreign_key: "assigned_user_id"
  has_many :timesheets, dependent: :destroy
  has_many :reported_incidents, class_name: "Incident", foreign_key: "reported_by_id"
end
