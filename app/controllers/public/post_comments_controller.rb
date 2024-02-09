class Public::PostCommentsController < ApplicationController
  before_action :post_idea_id_find, only: [:create, :destroy]
  
  def create
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_idea_id = @post_idea.id
    comment.save
    redirect_to public_post_idea_path(@post_idea)
  end
  
  def destroy
    
  end
  
  private
  
  def post_idea_id_find
    @post_idea = PostIdea.find(params[:post_idea_id])
  end
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
