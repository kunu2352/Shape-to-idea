class Admin::CallForIdeasController < ApplicationController
  def show
    
  end
  
  def create
    @call_for_idea = CallForIdea.new(call_for_idea_params)
    if @call_for_idea.invalid?
      render :new
    end
    if @call_for_idea.save
      redirect_to admin_idea_requests_path
    else 
      render :confirm
    end
  end
  
  def confirm
    @call_for_ideas = CallForIdea.new(call_for_idea_params)
    @call_for_ideas.user_id = @call_for_ideas.user_id
  end
  
  private
  
  def call_for_idea_params
    params.require(:call_for_idea).permit(:user_id, :title, :recruitment, :recruitment_image, :recruitment_image_banner)
  end
  
end
