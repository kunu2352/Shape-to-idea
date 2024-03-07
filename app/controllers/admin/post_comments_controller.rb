class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @post_comments = PostComment.all.page(params[:page]).per(25).order(created_at: :desc)
  end
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to admin_post_comments_path
  end
  
end
