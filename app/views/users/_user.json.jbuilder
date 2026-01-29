json.extract! user, :id, :name, :date_of_birth, :employee_number, :department, :created_at, :updated_at
json.url user_url(user, format: :json)
