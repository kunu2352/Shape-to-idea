# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: ENV['ADOMIN_EMAIL'],
  password: ENV['ADOMIN_PASSWORD'])
  
free = Category.find_or_create_by!(category_name: "Free") do |category|
  category.kana = "Free"
end
  
cook = Category.find_or_create_by!(category_name: "料理") do |category|
  category.kana = "りょうり"
end

sports = Category.find_or_create_by!(category_name: "スポーツ") do |category|
  category.kana = "すぽーつ"
end

housework = Category.find_or_create_by!(category_name: "家事") do |category|
  category.kana = "かじ"
end

event = Category.find_or_create_by!(category_name: "イベント") do |category|
  category.kana = "いべんと"
end

study = Category.find_or_create_by!(category_name: "学習") do |category|
  category.kana = "がくしゅう"
end

economize = Category.find_or_create_by!(category_name: "貯蓄") do |category|
  category.kana = "ちょちく"
end

camera = Category.find_or_create_by!(category_name: "カメラ") do |category|
  category.kana = "かめら"
end

service = Category.find_or_create_by!(category_name: "サービス") do |category|
  category.kana = "さーびす"
end

kakarot = User.find_or_create_by!(email: "kakarot@example.com") do |user|
  user.name = "悟空"
  user.password = "111111"
  user.telephone_number = "00000000000"
  user.introduction = "オス！おら悟空！"
  user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

vegeta = User.find_or_create_by!(email: "vegeta@example.com") do |user|
  user.name = "ベジタ"
  user.password = "111111"
  user.telephone_number = "00000000000"
  user.introduction = "毎日に退屈して何か新しいものを探しています。人の役に立てればうれしいです！！"
  # user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

nappa = User.find_or_create_by!(email: "nappa@example.com") do |user|
  user.name = "ナッパ"
  user.password = "111111"
  user.telephone_number = "00000000000"
  user.introduction = "株式会社ナッパ応援委員会　広報部　業務内容：人でを欲している農家さんと農家で働きたい人を結びつける仕事をしています。"
  # user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

gohan = User.find_or_create_by!(email: "gohan@example.com") do |user|
  user.name = "悟飯"
  user.password = "111111"
  user.telephone_number = "0000000"
  user.introduction = "18年○○大学卒 20年○○院卒　博士(農学)取得"
  # user.user_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

PostIdea.find_or_create_by!(title: "新規広告方法") do |post_idea|
  post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "5000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット
  $1企業からのワンちゃん必需品をプレゼント。お金がなくて犬が飼えない人にはチャンス。
  $1ワンちゃんへのメリット
  $1外出好きにはたまらなくうれしいはず。
  $1買い手がなく保護権になる犬がいると思う。金銭的問題解消により買い手が見つかる
  $1道端の人にメリット
  $1かわいい犬がいたらガン見しても許されます。"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法1") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "32000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット
  $1企業からのワンちゃん必需品をプレゼント。お金がなくて犬が飼えない人にはチャンス。
  $1ワンちゃんへのメリット
  $1外出好きにはたまらなくうれしいはず。
  $1買い手がなく保護権になる犬がいると思う。金銭的問題解消により買い手が見つかる
  $1道端の人にメリット
  $1かわいい犬がいたらガン見しても許されます。"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法2") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法3") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法4") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法5") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法6") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法7") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "新規広告方法8") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_idea.free_body = "犬がいたら大半の人が見つめます。日本人の特徴ではないかと思う。$1近くのスーパーで犬が主人の帰りを待っていました。
体感８割の人が犬を見つめていました。町中にある看板がどれほど効果がるかわからないがあれほど見られることは少ないと思います。"
  post_idea.price = "3000"
  post_idea.paid_body = "今回紹介するのは犬を広告等とした宣伝モデルです。
  $1犬に広告の服を着てもらう。＋月に最低900分の外出を行ってもらう。
  $1飼い主さんへのメリット"
  post_idea.category_id = Category.find_by(category_name: "Free").id
  post_idea.user = gohan
end

PostIdea.find_or_create_by!(title: "おいしく安く") do |post_idea|
  # post_idea.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post_idea.free_body = "レシピ：麻婆豆腐$1材料$1豆腐$1豆板醤$1ひき肉　鶏ｏｒ豚$1にんにく$1しょうが$1砂糖$1中華だしｏｒ和風だしの粉末$1醤油ｏｒ味噌$1片栗粉＋水$1水$1長ネギ"
  post_idea.price = "250"
  post_idea.paid_body = "分量豆腐:一丁
豆板醤:大さじ１程度 お好みで
ひき肉　鶏ｏｒ豚:１００g程度
にんにく:小さじ１
しょうが:すりおろし 小さじ１弱
砂糖:中さじ１ お好みで
中華だしｏｒ和風だしの粉末:中さじ１
醤油ｏｒ味噌:大さじ１
片栗粉＋水:片栗粉大さじ１(水大さじ２～３)
水:２００ｃｃ
長ネギ:一本の半分"
  post_idea.category_id = Category.find_by(category_name: "料理").id
  post_idea.user = kakarot
end
