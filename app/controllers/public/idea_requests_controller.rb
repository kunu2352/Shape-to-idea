class Public::IdeaRequestsController < ApplicationController
  def new
    @idea_request = IdeaRequest.new
  end

  def create
    @idea_request = IdeaRequest.new(idea_request_params)
    @idea_request.user_id = current_user.id
    if @idea_request.save
      redirect_to public_user_path(current_user.id)
    else
      render :new
    end
  end

  def index
    @idea_requests = IdeaRequest.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end


  private

  def idea_request_params
    params.require(:idea_request).permit(:title, :content, :stetus, :email, :telephone_number)
  end

end
