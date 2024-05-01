class Admin::CallForIdeasController < ApplicationController
  def show
    
  end
  
  def create
    @call_for_idea = CallForIdea.new(call_for_idea_params)
    
  end
  
  def confirm
    
  end
  
  private
  
  def call_for_idea_params
    params.require(:call_for_idea).permit(:user_id, :title, :recruitment, :recruitment_image, :recruitment_image_banner)
  end
  
end
