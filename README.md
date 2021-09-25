# README

# アプリケーション名:「FootRate」
 サッカー(football)の試合を観て出場した選手を評価(rate)して、他の人と意見を交換するアプリケーション。  
 
# アプリケーション概要
 世の中にいる全欧州サッカーファンを対象にしたアプリケーションです。  
 欧州サッカーは基本的に深夜にやっていて、見終わった後に誰とも感想を共有することができませんでした。  
 そこでこのアプリを通して意見を交換する場を提供したいです。  
 
# 工夫した点
 欧州サッカーの試合はシーズン中だと週に何試合も行われるので、大量のデータが必要になります。  
 そこで、"football-data.org"という外部APIを利用し大量のデータを取得し表示させる点を工夫しました。  
 投稿時にスタメンに加えてベンチから出てきた選手の情報を取得し自動的にフォームに表示させ、  
 ユーザーには点数とコメントを入力すればいい状態にしたことも工夫しました。  
 コメントあえてバリデーションを外し、最悪点数さえつければ投稿できる状態にして、気軽に投稿できるようにしました。
 
# URL
 *Herokuの都合上立ち上げに時間がかかってしまう可能性があります  
 https://footrate.herokuapp.com/  
 Eメール: a@a    
 パスワード: aaaaaa  
 ※ユーザー認証機能を実装しようと思いましたが、  
 　多くの人に気軽に使ってもらいたいと思ったため実在しないメールでも登録できるようにしています

# 実装した機能
 大量の試合データ表示  
 試合のスタメン、得点者表示  
 投稿機能   
 評価検索機能  
 ベスト11機能  
 ランキング機能  
 カレンダー機能  
 ログイン機能  
 
# 実装予定の機能
 サッカー関連のニュースを取得して表示  
 週や月ごとにランキングやベスト11の表示を変更  
 リマインダー機能

# デモ画像
 ## ユーザー関連
  deviseを用いてログイン機能を実装
  ### 新規登録
  <img width="278" alt="new_user" src="https://user-images.githubusercontent.com/78723740/134754018-4e44343e-b5bf-46ca-83af-9c7ebe95caac.png">
  ### ログイン
  <img width="278" alt="login" src="https://user-images.githubusercontent.com/78723740/134753998-a1450c0d-77f0-41ed-a228-286bff2cebd8.png">
  ### マイページ
  自分の投稿に加え、  
  simple_calenderというgemを使用して、お気に入りのチームの試合の情報をカレンダーに表示
  ### 編集

 ## トップページ
 トップページには注目の試合・最大9つの投稿・選手のランキングを表示
 ![toppage](https://user-images.githubusercontent.com/78723740/134754012-89fef79f-1078-40c3-afb2-a49252ee8ed0.gif)

 ## コンペティション詳細
 欧州5大リーグ、チャンピオンズリーグに加えて、ユーロの7コンペティションを扱っている
  ![league](https://user-images.githubusercontent.com/78723740/134753994-a6add64b-7eac-4e40-8d32-a9eb78421419.gif)
  ### 選択
  シーズン、節、得点ランキングなどを選択
  ![select](https://user-images.githubusercontent.com/78723740/134754004-7134a2d1-a84f-4062-b63b-474fecefc88c.gif)
   
 ## 試合詳細
 出場選手、得点者、交代選手、コメントなどを表示
 ![show](https://user-images.githubusercontent.com/78723740/134754009-293955dc-1459-436b-8c96-3aec99ecc2ae.gif)

 ## 投稿フォーム
 スタメンの選手と控えの選手の情報を自動的に取得し、セット
 ![new](https://user-images.githubusercontent.com/78723740/134754002-204f547f-fefa-4c08-9252-55e38163f196.gif)

 ## 評価関連
  ### 評価一覧
  ![rate_index](https://user-images.githubusercontent.com/78723740/134754336-a102d0cd-2d01-41a8-9e78-d17076006241.gif)
  ### 評価検索
  検索したいチーム名を入力
  ![rate_search](https://user-images.githubusercontent.com/78723740/134754341-93de22a3-a2fb-4fb8-86e9-521de7e78f46.gif)
  ### 評価詳細
  ![rate_show](https://user-images.githubusercontent.com/78723740/134754335-d6d8741c-d8f9-4782-b1a8-a86418cd4b24.gif)
  ### 評価削除
  ![rate_delete](https://user-images.githubusercontent.com/78723740/134754339-d8a0de0b-36c7-4577-891c-53f4586740f4.gif)

# 開発環境
 ## バックエンド
  Ruby 2.5.1  
  Ruby on Rails 5.2.5
 ## フロントエンド
  HTML  
  CSS  
  JavaSCript  
  Bootstrap
 ## データベース
  MySQL
