require 'rails_helper'

RSpec.describe 'アレンジレシピ機能', type: :system do
  let!(:clone_user){ FactoryBot.create(:clone_user) }
  let!(:recipe){ FactoryBot.create(:recipe) }
  describe 'アレンジレシピテスト' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: 'clone@clone.com'
      fill_in "user[password]",with: '123456'
      click_button 'ログイン'
      visit foods_path
      click_on 'test_ra-men'
      click_on 'アレンジレシピをみる'
    end
    context 'アレンジレシピ一覧にいった場合' do
      it 'レシピ詳細にいける' do
        click_on 'test_recipe'
        expect(page).to have_content 'test_recipe'
      end
      it '投稿できる' do
        click_on 'アレンジレシピを投稿する'
        fill_in "recipe[recipe_name]",with: 'sample_recipe'
        image_path = Rails.root.join('spec/fixtures/sample_ra-men.png')
        attach_file('recipe[recipe_image]', image_path, make_visible: true)
        fill_in "recipe[recipe_content]",with: 'sample_recipe_content'
        click_on '投稿'
        expect(page).to have_content 'レシピを作成しました。'
      end
      it '編集できる' do
        click_on 'アレンジレシピを投稿する'
        fill_in "recipe[recipe_name]",with: 'sample_recipe'
        image_path = Rails.root.join('spec/fixtures/sample_ra-men.png')
        attach_file('recipe[recipe_image]', image_path, make_visible: true)
        fill_in "recipe[recipe_content]",with: 'sample_recipe_content'
        click_on '投稿'
        click_on '編集'
        fill_in "recipe[recipe_name]",with: 'edit_recipe'
        click_on '投稿'
        expect(page).to have_content 'レシピを更新しました。'
      end
      it '削除できる' do
        click_on 'アレンジレシピを投稿する'
        fill_in "recipe[recipe_name]",with: 'sample_recipe'
        image_path = Rails.root.join('spec/fixtures/sample_ra-men.png')
        attach_file('recipe[recipe_image]', image_path, make_visible: true)
        fill_in "recipe[recipe_content]",with: 'sample_recipe_content'
        click_on '投稿'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'レシピを削除しました。'
      end
    end
  end
end
