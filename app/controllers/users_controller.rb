class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite = Favorite.find_by(food_id: params[:food_id], user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image, :image_cache)
  end
end
