json.extract! sale, :id, :sale_date, :sale_type_id, :user_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
