class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :profile_image, ImageUploader
  has_many :foods, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fevorite_foods, through: :favorites,source: :food
  def already_favorited?(food)
    self.favorites.exists?(food_id: food.id)
  end
end
