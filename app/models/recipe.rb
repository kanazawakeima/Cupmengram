class Recipe < ApplicationRecord
  mount_uploader :recipe_image, ImageUploader
  belongs_to :food
  belongs_to :user
end
