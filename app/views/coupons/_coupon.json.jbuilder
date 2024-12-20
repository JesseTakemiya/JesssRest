json.extract! coupon, :id, :code, :discount_amount, :start_date, :expiration_date, :usage_limit, :active, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
