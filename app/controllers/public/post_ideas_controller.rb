class Public::PostIdeasController < ApplicationController
before_action :user_find, only: [:edit, :show]

def index
  @post_ideas = PostIdea.all
  @categories = Category.all
end

def new
  @post_idea = PostIdea.new
end

def show
  @post_paid_confirm = Purchase.find_by(user_id: current_user.id) && Purchase.find_by(post_idea_id: @post_idea.id)
  #投稿を購入している人を判別するためのもの
  @purchase = Purchase.new
  @post_comment = PostComment.new
  @post_idea_new = PostIdea.new
end

def edit
  
end

def update
  post_idea = PostIdea.find(params[:id])
  post_idea.user_id = current_user.id
  if post_idea.update(post_idea_params)
    redirect_to public_post_idea_path(post_idea.id)
  else
    render :new
  end
end

def create
  @post_idea = PostIdea.new(post_idea_params)
  @post_idea.user_id = current_user.id
  
  if @post_idea.save!
    redirect_to public_post_idea_path(@post_idea.id)
  else
    render :new
  end
end


def destory
  
end


private

def user_find
  @post_idea = PostIdea.find(params[:id])
end


def post_idea_params
  params.require(:post_idea).permit(:post_idea_params, :category_id, :title, :status, :free_body, :paid_body, :premium, :price, :post_image)
end

end
