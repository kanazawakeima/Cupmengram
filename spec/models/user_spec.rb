require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '全て入力した場合' do
      it 'バリデーションに通る' do
        user = User.new(username: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
        expect(user).to be_valid
      end
    end
    context 'ユーザーネームが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: '', email: 'test@test.com', password: '123456', password_confirmation: '123456')
        expect(user).not_to be_valid
      end
    end
    context 'メールが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: 'test', email: '', password: '123456', password_confirmation: '123456')
        expect(user).not_to be_valid
      end
    end
    context 'メールの記述が違う場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: 'test', email: 'test', password: '123456', password_confirmation: '123456')
        expect(user).not_to be_valid
      end
    end
    context '同じメールがある場合' do
      it 'バリデーションにひっかる' do
        FactoryBot.create(:clone_user)
        user = User.new(username: 'test', email: 'clone@clone.com', password: '123456', password_confirmation: '123456')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: 'test', email: 'test@test.com', password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字以下空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: 'test', email: 'test@test.com', password: '1', password_confirmation: '1')
        expect(user).not_to be_valid
      end
    end
    context '確認パスワードが違う場合' do
      it 'バリデーションにひっかる' do
        user = User.new(username: 'test', email: 'test@test.com', password: '123456', password_confirmation: '111111')
        expect(user).not_to be_valid
      end
    end
  end
end
