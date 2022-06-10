class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  validates :score, presence: true
end
