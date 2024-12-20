json.extract! customer, :id, :name, :phone, :email, :time_in, :time_out, :loyalty_points, :membership_status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
