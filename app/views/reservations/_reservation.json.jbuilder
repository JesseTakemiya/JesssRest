json.extract! reservation, :id, :date, :time, :number_of_guest, :status, :customer_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
