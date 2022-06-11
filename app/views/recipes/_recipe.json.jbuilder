json.extract! recipe, :id, :food_id, :recipe_name, :recipe_content, :recipe_image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
