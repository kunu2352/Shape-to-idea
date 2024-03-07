class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # いいね登録
    post_idea = PostIdea.find(params[:post_idea_id])
    favorite = current_user.favorites.new(post_idea_id: post_idea.id)
    favorite.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # いいね解除
    post_idea = PostIdea.find(params[:post_idea_id])
    favorite = current_user.favorites.find_by(post_idea_id: post_idea.id)
    favorite.destroy!
    redirect_back(fallback_location: root_path)
  end


end
