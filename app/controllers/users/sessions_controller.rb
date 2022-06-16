class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def admin_guest_sign_in
    user = User.admin_guest
    sign_in user
    redirect_to root_path, notice: '管理者ゲストユーザーとしてログインしました。'
  end
end
