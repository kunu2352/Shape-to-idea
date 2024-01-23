class Public::PostIdeasController < ApplicationController

def index
  @post_ideas = PostIdea.all
end

def new
  @post_idea = PostIdea.new
end

def show
  @podt_idea = PostIdea.find
end

def edit
  @podt_idea = PostIdea.find
end

def create
  @post_idea = PostIdea.new(post_idea_params)
end

def destory
  
end

end
