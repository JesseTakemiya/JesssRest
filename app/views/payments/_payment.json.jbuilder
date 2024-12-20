json.extract! payment, :id, :method, :amount, :date, :bill_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
