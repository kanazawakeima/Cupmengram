require 'rails_helper'

RSpec.describe 'フード機能', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:admin_user){ FactoryBot.create(:admin_user) }
  let!(:food){ FactoryBot.create(:food) }
  let!(:second_food){ FactoryBot.create(:second_food) }
  describe '一般ユーザーテスト' do
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
      it 'レビューを投稿できる' do
        click_on 'star'
        binding.irb
      end
      it 'レビューを見れる' do
        click_on 'レビューをみる'
        expect(page).to have_content 'test_ra-menレビュー画面'
      end
      it 'アレンジレシピを見れる' do
        click_on 'アレンジレシピをみる'
        expect(page).to have_content 'test_ra-menのアレンジレシピ'
      end
      it 'いいねができる' do
        click_on 'like'
        expect(page).to have_content '1いいね'
      end
    end
  end
  describe '管理者ユーザーテスト' do

  end
end
