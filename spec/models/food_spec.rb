require 'rails_helper'
describe 'Foodモデル機能', type: :model do
  let!(:admin_user){ FactoryBot.create(:admin_user) }
  context 'フードのimageが空の場合' do
    it 'バリデーションがかかる' do
      food = Food.new(name: 'test', image: nil, content: 'test_recipe', company: 'test', price: '200', taste: 'しょうゆ', genre: 'コッテリ')
      expect(food).not_to be_valid
    end
  end
end
