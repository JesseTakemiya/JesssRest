json.extract! table, :id, :number, :capacity, :status, :reservation_id, :created_at, :updated_at
json.url table_url(table, format: :json)
