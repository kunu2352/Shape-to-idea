class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update, :confirm, :withdrawal]
  before_action :is_matching_login_user, only:[:edit, :update, :confirm, :purchased, :favorite_all]
  before_action :guest_user_limit, only:[:edit, :update, :purchased ,:favorite_all ,:confirm]

  def show
    # ユーザー詳細画面(ユーザーの情報とユーザーの投稿一覧)
    @user = User.find(params[:id])
    @post_ideas = @user.post_ideas.where(status: "published").page(params[:page]).order(created_at: :desc)
    # 投稿のステータスが非表示の場合はログインユーザー(自身のページ)以外に表示させない
    @post_ideas_current_user = @user.post_ideas.page(params[:page]).order(created_at: :desc)
    # 投稿のステータスが非表示の場合でもログインユーザー(自身のページ)は表示させる
  end

  def purchased
    # 購入した投稿の一覧
    @user = User.find(params[:id])
    @purchases = Purchase.where(user_id: current_user.id).page(params[:page]).order(created_at: :desc)
  end

  def favorite_all
    # いいねした投稿の一覧
    @user = User.find(params[:id])
    @favorites = current_user.favorites.page(params[:page]).order(created_at: :desc)
  end

  def edit
    # ユーザーの情報編集画面
    @user = current_user
  end

  def update
    # ユーザーの情報編集
    @user = current_user
    @user.update(user_params)
    redirect_to public_user_path(@user.id)
  end

  def confirm
    # 退会確認画面
    @user = User.find(params[:id])
  end

  def withdrawal
    # 退会機能
    @user = current_user
    @user.update(is_active: false)
    @user.post_ideas.each do |post_idea|
      post_idea.update(status: 1)
    end
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました"
  end

  private
  
  def guest_user_limit
    if current_user.email == 'guest@example.com'
      redirect_to public_user_path(current_user.id)
    end
  end

  def user_params
   params.require(:user).permit(:name, :email, :encrypted_password, :telephone_number, :is_active, :user_image, :introduction )
  end

  def is_matching_login_user
    user =  User.find(params[:id])
    unless user.id == current_user.id
      redirect_to public_user_path(current_user.id)
    end
  end

end
