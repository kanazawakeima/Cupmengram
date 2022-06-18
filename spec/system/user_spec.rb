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
        click_on 'ログアウト', match: :first
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
  describe '管理画面のテスト' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:admin_user){ FactoryBot.create(:admin_user) }
    let!(:food){ FactoryBot.create(:food) }
    let!(:second_food){ FactoryBot.create(:second_food) }
    context '管理画面にアクセスした場合' do
      before do
        visit new_user_session_path
        fill_in "user[email]",with: "admin@admin.com"
        fill_in "user[password]",with: "123456"
        click_button "ログイン"
        visit rails_admin_path
      end
      it '管理者画面に推移する' do
        expect(current_path).to eq rails_admin_path
      end
      it 'ユーザー新規登録が可能か' do
        click_on 'ユーザー', match: :first
        click_on '新規作成'
        fill_in "user[email]",with: "hoge@hoge.com"
        fill_in "user[password]",with: "123456"
        fill_in "user[password_confirmation]",with: "123456"
        fill_in "user[username]",with: "hoge"
        click_on "保存"
        expect(page).to have_content 'ユーザーの作成に成功しました'
      end
      it 'ユーザーの詳細を見れるか' do
        click_on 'ユーザー', match: :first
        click_on '詳細', match: :first
        expect(page).to have_content 'admin@admin.com'
      end
      it 'ユーザーの編集ができるか' do
        click_on 'ユーザー', match: :first
        click_on '編集', match: :first
        fill_in "user[username]",with: "keima"
        click_on "保存"
        expect(page).to have_content 'ユーザーの更新に成功しました'
      end
      it 'ユーザーの削除ができるか' do
        FactoryBot.create(:clone_user)
        click_on 'ユーザー', match: :first
        click_on '削除', match: :first
        click_on '実行する', match: :first
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
  end
end
