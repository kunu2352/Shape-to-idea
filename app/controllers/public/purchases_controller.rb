class Public::PurchasesController < ApplicationController
  
  def create
    @purchase = Purchase.new(params_purchase)
    @purchase.user_id = current_user.id
    # @post_idea = PostIdea.find(params[:id])
    if @purchase.save
      redirect_to new_public_post_idea_path
    else
      render controller: 'post_ideas', action: 'show'
    end
  end
  
  
  private
  
  def params_purchase
    params.require(:purchase).permit(:user_id, :post_idea_id)
  end
    
end
