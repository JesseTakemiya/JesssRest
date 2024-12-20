json.extract! menu_inventory, :id, :quantity_required, :menu_id, :inventory_id, :created_at, :updated_at
json.url menu_inventory_url(menu_inventory, format: :json)
