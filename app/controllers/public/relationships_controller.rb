class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    # フォロー機能
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_back(fallback_location: root_path)
    # redirect_to public_user_path(user.id)
  end

  def destroy
    # フォロー解除機能
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_back(fallback_location: root_path)
  end

  def followings
    # フォローしている人一覧
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    # フォロワー一覧
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
