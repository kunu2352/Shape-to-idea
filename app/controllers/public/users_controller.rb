class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update, :confirm, :withdrawal]
  
  def show
    @user = User.find(params[:id])
    @post_ideas = @user.post_ideas.page(params[:page])
  end

  def purchased
    @user = User.find(params[:id])
    @purchases = Purchase.where(user_id: current_user.id)
  end
  
  def favorite_all
    @user = User.find(params[:id])
    @favorites = current_user.favorites
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
  end

  def confirm
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました"
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :encrypted_password, :telephone_number, :is_active, :user_image, :introduction )
  end

  def is_matching_login_user
    user = current_user
    unless user.id = current_user.id
      redirect_to public_user_path(current_user.id)
    end
  end

end
