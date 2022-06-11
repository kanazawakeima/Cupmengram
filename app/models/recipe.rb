class Recipe < ApplicationRecord
  mount_uploader :recipe_image, ImageUploader
  belongs_to :food
end
