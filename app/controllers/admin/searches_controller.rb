class Admin::SearchesController < ApplicationController
  def index
    @range = params[:range]
    if @range == 'User'
      @users = User.looks(params[:word]).where.not(email: 'guest@example.com')
    else
      @post_ideas = PostIdea.looks(params[:word])
    end
  end

end
