class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update, :confirm, :withdrawal]

  def show
    @user = User.find(params[:id])
    # ログインユーザー以外用
    @post_ideas = @user.post_ideas.where(status: "published").page(params[:page])
    # ログインユーザー用
    @post_ideas_current_user = @user.post_ideas.page(params[:page])
  end

  def purchased
    @user = User.find(params[:id])
    @purchases = Purchase.where(user_id: current_user.id).page(params[:page])
  end

  def favorite_all
    @user = User.find(params[:id])
    @favorites = current_user.favorites.page(params[:page])
    #     @favorites = current_user.favorites
    # @favorites.each do |favorite|
    #   @favorite_contributor = favorite.post_idea.status != "published" && favorite.post_idea.user == current_user
    #   @favorite_not_contributor = favorite.post_idea
    # end
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
    @user.post_ideas.each do |post_idea|
      post_idea.update(status: 1)
    end
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
