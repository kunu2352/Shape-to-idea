class Public::CategoryController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @post_ideas = @category.post_ideas.where(status: "published" ).page(params[:page]).order(created_at: :desc)
  end


end
