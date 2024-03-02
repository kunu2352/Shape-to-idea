class Public::PurchasesController < ApplicationController
  
  def create
    @purchase = Purchase.new(params_purchase)
    @purchase.user_id = current_user.id
    @post_idea = @purchase.post_idea
    if @purchase.save
      redirect_to public_post_idea_path(@post_idea.id)
    else
      render controller: 'post_ideas', action: 'show'
    end
  end
  
  
  private
  
  def params_purchase
    params.require(:purchase).permit(:user_id, :post_idea_id)
  end
    
end
