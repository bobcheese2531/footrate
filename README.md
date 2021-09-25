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

# 実装した機能
 大量の試合データ表示
 試合のスタメン、得点者表示
 投稿機能  
 評価検索機能  
 
# 実装予定の機能
 サッカー関連のニュースを取得して表示  
 週や月ごとにランキングやベスト11の表示を変更
 リマインダー機能

 # 画像
 ## ログイン
![login](https://user-images.githubusercontent.com/78723740/124237979-179f0c80-db53-11eb-8d1b-149fa0f8e4b0.gif)

 ## トップページ
 トップページには注目の試合と最大9つの投稿を表示
![game_index](https://user-images.githubusercontent.com/78723740/124237927-07872d00-db53-11eb-90f4-1722ded08051.gif)

## コンペティション詳細
 欧州5大リーグ、チャンピオンズリーグに加えて、ユーロの7コンペティションを扱っている
![games_league](https://user-images.githubusercontent.com/78723740/124237953-0f46d180-db53-11eb-8b0b-0bbb42a97de9.gif)
### シーズンの選択
過去3シーズンのデータを取得できる  
順位表はAPIの都合上、直近のシーズンのみ表示
![year_select](https://user-images.githubusercontent.com/78723740/124238070-2b4a7300-db53-11eb-8346-ee6ee2a09d36.gif)
### 節の選択
節ごとに試合の情報を分けて見やすくするだけでなく、API取得の速度を上げた
![matchday_select](https://user-images.githubusercontent.com/78723740/124238023-21c10b00-db53-11eb-85f8-e557697ba842.gif)
### 得点ランキング
![score_ranking](https://user-images.githubusercontent.com/78723740/124238088-2c7ba000-db53-11eb-8241-ad33e7796ad1.gif)

## 試合詳細
ベンチに下がった選手には"↓"、控えとして出た選手には"↑"、得点した選手には"G"を横に表示
![games_show](https://user-images.githubusercontent.com/78723740/124237962-11a92b80-db53-11eb-8373-9e2a7b86aced.gif)

## 投稿フォーム
スタメンの選手と控えの選手の情報を自動的に取得し、セット
![form](https://user-images.githubusercontent.com/78723740/124237921-0524d300-db53-11eb-8b82-c564efb8ad41.gif)

## 評価関連
### 評価一覧
![rate_index](https://user-images.githubusercontent.com/78723740/124238056-2980af80-db53-11eb-8e99-52271ca6444e.gif)
### 評価検索
検索したいチーム名を入力
![rate_search](https://user-images.githubusercontent.com/78723740/124238065-2ab1dc80-db53-11eb-8deb-e5ddc39d7f07.gif)
### 評価詳細
![rate_show](https://user-images.githubusercontent.com/78723740/124238072-2b4a7300-db53-11eb-9c66-41a9916987dc.gif)
### 評価削除
![rate_delete](https://user-images.githubusercontent.com/78723740/124238037-24bbfb80-db53-11eb-909a-74643586d04c.gif)

## マイページ
自分の好きなチームの情報と自分の投稿を表示
![mypage](https://user-images.githubusercontent.com/78723740/124238030-238ace80-db53-11eb-8769-a17b66e7a585.gif)
### 編集
![user_edit](https://user-images.githubusercontent.com/78723740/124238067-2ab1dc80-db53-11eb-89cb-26cc0a2c35f6.gif)

# 開発環境
## バックエンド
 Ruby 2.5.1  
 Ruby on Rails 5.2.5
## フロントエンド
 HTML  
 CSS  
 JavaSCript
## データベース
 MySQL
