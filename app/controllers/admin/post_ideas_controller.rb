class Admin::PostIdeasController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post_idea = PostIdea.find(params[:id])
  end
  
  def index
    @post_ideas = PostIdea.all.page(params[:page]).per(30)
  end
  
  def purchase
    @post_ideas = Purchase.all
  end
  
  def published
    @post_idea = PostIdea.find(params[:post_idea_id])
    @post_idea.update(status: 0)
    redirect_to admin_post_comments_path
  end
  
  def unpublished
    @post_idea = PostIdea.find(params[:post_idea_id])
    @post_idea.update(status: 1)
    redirect_to admin_post_comments_path
  end
  
  private
  
  def post_idea_params
    params.require(:user).permit(:status)
  end
  
end
