class Public::FavoritesController < ApplicationController
  
  
  def create
    post_idea = PostIdea.find(params[:post_idea_id])
    favorite = current_user.favorites.new(post_idea_id: post_idea.id)
    favorite.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post_idea = PostIdea.find(params[:post_idea_id])
    favorite = current_user.favorites.find_by(post_idea_id: post_idea.id)
    favorite.destroy!
    redirect_back(fallback_location: root_path)
  end


end
