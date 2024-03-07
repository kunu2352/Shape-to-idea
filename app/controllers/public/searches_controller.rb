class Public::SearchesController < ApplicationController
  def search
    # 検索機能
    @range = params[:range]
    if @range == 'User'
      # 検索値がUserなら
      @users = User.looks(params[:word]).where.not(email: 'guest@example.com').where.not(is_active: false)
      # ゲストユーザーは検索に表示されない
    else
      # 検索値がUser以外
      @post_ideas = PostIdea.looks(params[:word])
    end
  end
end
