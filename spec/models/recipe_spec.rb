require 'rails_helper'
  describe 'Foodモデル機能', type: :model do
    let!(:user){ FactoryBot.create(:user) }
    let!(:food){ FactoryBot.create(:food) }
    context 'アレンジレシピのimageが空の場合' do
      it 'バリデーションがかかる' do
        recipe = Recipe.new(recipe_name: 'test', recipe_image: nil, recipe_content: 'test_recipe', user: user, food: food)
        expect(recipe).not_to be_valid
      end
    end
  end
