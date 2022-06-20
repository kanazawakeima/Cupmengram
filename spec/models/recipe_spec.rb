require 'rails_helper'
describe 'フードモデル機能', type: :model do
  let!(:clone_user){ FactoryBot.create(:clone_user) }
  describe 'バリデーションのテスト' do
    context 'imageが空の場合' do
      it 'バリデーションにひっかる' do
        recipe = Recipe.new(recipe_name: 'recipe_test', image: '', recipe_content: 'test')
        expect(food).to not_be_valid
      end
    end
  end
end
