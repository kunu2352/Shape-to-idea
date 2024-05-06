class Admin::CallForIdeasController < ApplicationController
  def show
    
  end
  
  def create
    @call_for_idea = CallForIdea.new(call_for_idea_params)
    if @call_for_idea.invalid?
      render :new
    end
  end
  
  def confirm
    @call_for_idea = CallForIdea.new
  end
  
  private
  
  def call_for_idea_params
    params.permit(:user_id, :title, :recruitment, :recruitment_image, :recruitment_image_banner)
  end
  
end
