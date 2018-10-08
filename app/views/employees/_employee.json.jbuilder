json.extract! employee, :id, :national_registry_number, :name, :job_role, :company_id, :user_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
