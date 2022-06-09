json.extract! food, :id, :name, :image, :content, :company, :price, :taste, :genre, :created_at, :updated_at
json.url food_url(food, format: :json)
