json.extract! menu, :id, :dish_name, :category, :price, :description, :availble, :created_at, :updated_at
json.url menu_url(menu, format: :json)
