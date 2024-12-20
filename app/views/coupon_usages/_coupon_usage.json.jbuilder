json.extract! coupon_usage, :id, :date, :customer_id, :order_id, :coupon_id, :created_at, :updated_at
json.url coupon_usage_url(coupon_usage, format: :json)
