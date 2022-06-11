class Favorite < ApplicationRecord
  belongs_to :food
  belongs_to :user
  validates_uniqueness_of :food_id, scope: :user_id
end
