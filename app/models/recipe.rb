class Recipe < ApplicationRecord
  mount_uploader :recipe_image, ImageUploader
  belongs_to :food
  belongs_to :user

  validates :recipe_name, presence: true
  validates :recipe_content, presence: true
  validates :recipe_image, presence: true
end
