class Food < ApplicationRecord
  mount_uploader :image, ImageUploader
  enum taste: { しょうゆ: 0, しお: 1, とんこつ: 2, 味噌: 3, その他: 4 }
  enum genre: { あっさり: 0, コッテリ: 1, 辛い: 2 }
  has_many :reviews, dependent: :destroy
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
