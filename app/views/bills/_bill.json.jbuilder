json.extract! bill, :id, :total_amount, :status, :order_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
