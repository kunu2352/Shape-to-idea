class Public::PostIdeasController < ApplicationController

def index
  @post_ideas = PostIdea.all
end

def new
  @post_idea = PostIdea.new
end

def show
  @podt_idea = PostIdea.find(params[:id])
end

def edit
  @podt_idea = PostIdea.find
end

def create
  # @ctegory = Category.find(params[:id])
  @post_idea = PostIdea.new(post_idea_params)
  @post_idea.user_id = current_user.id
  # @post_idea.category_id = @category.id
  if @post_idea.save
    redirect_to public_post_idea_path(@post_idea.id)
  else
    render:edit
  end
end


def update

end

def destory

end



private

def post_idea_params
  params.require(:post_idea).permit(:post_idea_params, :category_id, :title, :status, :free_body, :paid_post, :premium)
end

end
