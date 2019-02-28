class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @@user = @user
    @transactions = Transaction.where(user_id: @user.id)
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
