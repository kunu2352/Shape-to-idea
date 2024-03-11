class Admin::CategoryController < ApplicationController
  before_action :authenticate_admin!
  def new
    # カテゴリー表示
    @categories = Category.all.page(params[:page]).per(20)
    # カテゴリー作成
    @category = Category.new
  end
  
  def create
    # カテゴリー作成
    category = Category.new(category_params)
    if category.save
      redirect_to new_admin_category_path
    else
      render :new
    end
  end
  
  def destroy
    # カテゴリー削除
    category = Category.find(params[:id])
    category.destroy
    redirect_to new_admin_category_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:category_name, :kana)
  end
  
end
