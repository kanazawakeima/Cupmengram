class Food < ApplicationRecord
  mount_uploader :image, ImageUploader
  enum taste: { しょうゆ: 0, しお: 1, とんこつ: 2, 味噌: 3, その他: 4 }
  enum genre: { あっさり: 0, コッテリ: 1, 辛い: 2 }
end
