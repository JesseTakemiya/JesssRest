json.extract! order, :id, :time, :total_amount, :discount_amount, :status, :customer_id, :table_id, :employee_id, :created_at, :updated_at
json.url order_url(order, format: :json)
