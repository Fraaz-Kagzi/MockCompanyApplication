class User < ApplicationRecord
  has_many :assigned_jobs, class_name: "Job", foreign_key: "assigned_user_id"
  has_many :timesheets, dependent: :destroy
end
