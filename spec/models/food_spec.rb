require 'rails_helper'
describe 'Foodモデル機能', type: :model do
  let!(:admin_user){ FactoryBot.create(:admin_user) }
  context 'Foodのimageが空の場合' do
    it 'バリデーションにひっかる' do
      food = Food.new(name: 'test', content: 'test', company: 'test', price: '200', taste: 'しょうゆ', genre: 'あっさり')
      expect(food).to not_be_valid
    end
  end
end
