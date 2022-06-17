require 'rails_helper'

RSpec.describe "ユーザーテスト",type: :system do
  describe 'ユーザ登録テスト' do
    context '新規登録した場合' do
      it 'トップ画面にいく' do
        visit new_user_registration_path
        fill_in "user[username]",with: 'tanaka'
        fill_in "user[email]",with: 'tanaka@tanaka.com'
        fill_in "user[password]",with: '123456'
        fill_in "user[password_confirmation]",with: '123456'
        click_on 'サインアップ'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      before do
        FactoryBot.create(:food)
        FactoryBot.create(:second_food)
      end
      it '未ログインでラーメン詳細に飛ぶ時、ログイン画面に遷移する' do
        visit foods_path
        click_on 'test_ra-men'
        expect(current_path).to eq user_session_path
      end
    end
  end
  describe 'セッション機能テスト' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:admin_user){ FactoryBot.create(:admin_user) }
    before do
      visit new_user_session_path
      fill_in "user[email]",with: 'test@test.com'
      fill_in "user[password]",with: '123456'
      click_button 'ログイン'
    end
    context 'ログインした場合' do
      it 'ログイン成功のアラートが出る' do
        expect(page).to have_content 'ログインしました'
      end
      it '自分の詳細画面(マイページ)に飛べる' do
        click_on 'マイページ'
        expect(current_path).to eq user_path(id: user.id)
      end
      it '他人のページにアクセスするとタスク一覧画面に飛ぶ' do
        visit user_path(id: admin_user.id)
        expect(current_path).to eq foods_path
      end
      it 'ログアウトできる' do
        find('input.offset-2').click
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

end
