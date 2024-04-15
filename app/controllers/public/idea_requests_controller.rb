class Public::IdeaRequestsController < ApplicationController
  def new
    @idea_reauest = IdeaRequest.new
  end
  
  def create
    @idea_reauest = IdeaRequest.new
    @idea_reauest.user_id = current_user.id
    if @idea_reauest.save
      redirect_to
    else
      render :new
    end
  end
  
  def index
    @idea_requests = IdeaRequest.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end
  
  
  private
  
  def idea_request_params
    params.requir(:idea_request).permit(:title, :amount, :content)
  end
  
end
