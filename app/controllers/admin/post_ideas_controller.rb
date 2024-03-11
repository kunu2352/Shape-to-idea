class Admin::PostIdeasController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post_idea = PostIdea.find(params[:id])
  end
  
  def index
    @post_ideas = PostIdea.all.page(params[:page]).per(30).order(created_at: :desc)
  end
  
  def purchase
    @post_ideas = Purchase.all.order(created_at: :desc)
  end
  
  def published
    # 投稿を公開する
    @post_idea = PostIdea.find(params[:post_idea_id])
    @post_idea.update(status: 0)
    redirect_to admin_post_idea_path(@post_idea.id)
  end
  
  def unpublished
    # 投稿を非公開にする
    @post_idea = PostIdea.find(params[:post_idea_id])
    @post_idea.update(status: 1)
    redirect_to admin_post_idea_path(@post_idea.id)
  end
  
  private
  
  def post_idea_params
    params.require(:user).permit(:status)
  end
  
end
