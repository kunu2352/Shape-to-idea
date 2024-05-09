
class Admin::IdeaRequestsController < ApplicationController
  def index
    @idea_requests = IdeaRequest.all
  end
  
  def show
    @idea_request = IdeaRequest.find(params[:id])
    @call_for_idea = CallForIdea.new
  end
  
  
end
