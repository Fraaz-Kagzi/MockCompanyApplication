json.extract! timesheet, :id, :user_id, :week_start, :status, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
