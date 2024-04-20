
class Admin::IdeaRequestsController < ApplicationController
  def index
    @idea_requests = IdeaRequest.all
  end
  
  def show
    @idea_request = IdeaRequest.find(params[:id])
  end
  
  
end
