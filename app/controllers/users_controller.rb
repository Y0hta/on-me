class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:alert] = "プロフィールが更新されました"
    redirect_to edit_user_path(current_user)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :occupation, :introduction, :image, :email, :password)
  end
end