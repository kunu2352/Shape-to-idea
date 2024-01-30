class Public::CategoryController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @post_ideas = @category.post_ideas
  end
  
  
end
