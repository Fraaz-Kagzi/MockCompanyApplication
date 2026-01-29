json.extract! job, :id, :title, :description, :status, :scheduled_for, :created_at, :updated_at
json.url job_url(job, format: :json)
