class Public::CategoryController < ApplicationController

  def show
    # カテゴリーごとの投稿表示
    @categories = Category.all.sort_by { |category| category.kana }
    @category = Category.find(params[:id])
    @post_ideas = @category.post_ideas.where(status: "published" ).page(params[:page]).order(created_at: :desc)
  end


end
