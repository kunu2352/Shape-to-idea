class Public::PostIdeasController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :create]
  before_action :post_idea_find, only: [:edit, :show]
  before_action :purchase_by, only:[:show]
  before_action :purchase_post_edit, only:[:edit]
  before_action :guest_user_limit, only:[:edit, :update]

  def index
    # 投稿一覧
    @post_ideas = PostIdea.where(status: "published").page(params[:page]).order(created_at: :desc)
    @categories = Category.all.sort_by { |category| category.kana }
  end

  def new
    # 投稿作成
    @post_idea = PostIdea.new
  end

  def show
    # 投稿の詳細
    # beforeacion @post_idea = PostIdea.find(params[:id])
    if current_user
      @post_paid_confirm = Purchase.find_by(user_id: current_user.id) && Purchase.find_by(post_idea_id: @post_idea.id)
    end
    #投稿を購入している人を判別するためのもの 購入をするとPurchaseにuser.idとpost_idea.idが格納されいるか確認
    @purchase = Purchase.new
    @post_comment = PostComment.new
    @post_idea_new = PostIdea.new
    @user = @post_idea.user
  end

  def edit
    # 投稿の編集画面
    # beforeacion @post_idea = PostIdea.find(params[:id])
  end

  def update
    # 投稿の編集
    @post_idea = PostIdea.find(params[:id])
    @post_idea.user_id = current_user.id
    if @post_idea.update(post_idea_params)
      redirect_to public_post_idea_path(@post_idea.id)
    else
      render :edit
    end
  end

  def create
    # 投稿作成
    @post_idea = PostIdea.new(post_idea_params)
    @post_idea.user_id = current_user.id
    if @post_idea.save
      redirect_to public_post_idea_path(@post_idea.id)
    else
      render :new
    end
  end

  private

# 投稿が購入されている場合編集できないようにする
  def purchase_post_edit
    if Purchase.exists?(post_idea_id:  @post_idea.id)
      redirect_to public_post_idea_path(@post_idea.id)
    end
  end

# 投稿が非表示状態の際に購入していないユーザーがURLから入ることを防ぐ
  def purchase_by
    if @post_idea.user != current_user
      if @post_idea.status != "published"
        if !Purchase.exists?(user_id: current_user.id)
          redirect_to public_post_ideas_path
        end
      end
    end
  end
  
  def guest_user_limit
    if current_user.email == 'guest@example.com'
      redirect_to public_post_idea_path(@post_idea.id)
    end
  end


  def post_idea_find
    @post_idea = PostIdea.find(params[:id])
  end


  def post_idea_params
    params.require(:post_idea).permit(:post_idea_params, :category_id, :title, :status, :free_body, :paid_body, :premium, :price, :post_image)
  end

end
