class Admin::CategoryController < ApplicationController
  def new
    @categories = Category.all
    @category = Category.new
  end
  
  def create
    
    category = Category.new(category_params)
    if category.save
      redirect_to new_admin_category_path
    else
      render :new
    end
  end
  
  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to new_admin_category_path
  end
  
  private
  
  def category_params
    params.require(:category).permit(:category_name)
    
  end
  
end
