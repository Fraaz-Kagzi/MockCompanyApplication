json.extract! incident, :id, :reported_by_id, :job_id, :occurred_on, :location, :description, :severity, :status, :created_at, :updated_at
json.url incident_url(incident, format: :json)
