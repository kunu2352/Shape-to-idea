class Purchase < ApplicationRecord
  #投稿購入者と有料投稿との紐づけよう中間テーブル
  # 購入をするとPurchaseにuser.idとpost_idea.idが格納される
  belongs_to :user
  belongs_to :post_idea
end
