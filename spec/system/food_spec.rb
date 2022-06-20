require 'rails_helper'

RSpec.describe 'フード機能', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:admin_user){ FactoryBot.create(:admin_user) }
  let!(:food){ FactoryBot.create(:food) }
  let!(:second_food){ FactoryBot.create(:second_food) }
  describe '一般ユーザーテスト', js: true do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: 'test@test.com'
      fill_in "user[password]",with: '123456'
      click_button 'ログイン'
      visit foods_path
    end
    context 'ラーメン詳細をみる場合' do
      before do
        click_on 'test_ra-men'
      end
      it 'ラーメン詳細にいける' do
        expect(page).to have_content 'test_ra-men'
      end
      # it 'レビューを投稿できる' do
      #   binding.irb
      #   click_on 'star'
      #   click_on '投稿'
      # end
      it 'レビューを見れる' do
        click_on 'レビューをみる'
        expect(page).to have_content 'test_ra-menレビュー画面'
      end
      it 'アレンジレシピを見れる' do
        click_on 'アレンジレシピをみる'
        expect(page).to have_content 'test_ra-menのアレンジレシピ'
      end
      # it 'いいねができる' do
      #   click_on 'like'
      #   expect(page).to have_content '1いいね'
      # end
    end
  end
  describe '管理者ユーザーテスト' do
    before do
      visit new_user_session_path
      fill_in "user[email]",with: 'admin@admin.com'
      fill_in "user[password]",with: '123456'
      click_button 'ログイン'
      visit foods_path
    end
    context '管理者モードでのラーメン管理' do
      it 'ラーメン新規作成ができる' do
        visit new_food_path
        fill_in "food[name]",with: 'サンプルラーメン'
        image_path = Rails.root.join('spec/fixtures/sample_ra-men.png')
        attach_file('food[image]', image_path, make_visible: true)
        fill_in "food[content]",with: 'sample'
        fill_in "food[company]",with: 'sample'
        fill_in "food[price]",with: '150'
        select "とんこつ",from: 'food_taste'
        select "辛い",from: 'food_genre'
        click_on "投稿"
        expect(page).to have_content '作成できました。'
      end
      it 'ラーメンを編集できる' do
        click_on '編集', match: :first
        fill_in "food[name]",with: 'edit_ra-men'
        click_on "投稿"
        expect(page).to have_content '更新できました。'
      end
      it 'ラーメンを削除できる' do
        click_on '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除できました。'
      end
    end
  end
end
