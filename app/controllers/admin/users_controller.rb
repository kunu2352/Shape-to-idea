class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @post_idea =@user.post_ideas.page(params[:page]).per(30).order(created_at: :desc)
  end
end
