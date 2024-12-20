json.extract! inventory, :id, :ingradient_name, :stock_quantity, :threshold, :reorder_quantity, :last_updated, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
