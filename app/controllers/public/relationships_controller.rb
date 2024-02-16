class Public::RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to public_user_path(user.id)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to public_user_path(user.id)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  # private

  # def user_find
  #   @user = User.find(params[:user_id])
  # end


end
