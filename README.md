# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type     | Options                      |
| ---------- | -------- | -----------                  |
| title      | string   | null: false                  |
| catch_copy | text     | null: false                  |
| concept    | text     | null: false                  |
| user       |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user


# アプリケーション名
  ProtoSpace（プロトスペース）  

## アプリケーション概要
  アプリ開発をしているユーザーが、プロトタイプについてフィードバックを得られるサービス   

## URL
  https://protospace-33923.herokuapp.com/

## BASIC認証
  なし

## テスト用アカウント
  test  
  メールアドレス：test@sample  
  パスワード：aaaaaa  

  test２  
  メールアドレス：test2@sample  
  パスワード：aaaaaa  

## 利用方法
  ユーザーは、新規登録後に、画像付きでプロトタイプの情報を投稿することができます。  
  投稿内容は編集、削除可能です。そしてコメント欄にて、他のユーザーからフィードバックを得られます。  
  ※画像は、JPG,PNG以外を投稿したり、画像が大きすぎるとエラーが起きてしまう可能性があるため避けていただきますようお願いします。  

## 目指した課題解決
  気軽にプロトタイプの情報を投稿して、他のユーザーからフィードバックをもらいたい    

## 洗い出した要件
  ユーザー管理機能  
  コメント投稿機能  
  写真付きメッセージ投稿機能  

## 実装した機能についてのGIFと説明
  https://i.gyazo.com/8b0ab8a1ddb5bb84371634673c22ae1a.gif
  
## データベース設計
  https://i.gyazo.com/a7ea1b5fcfe8e23e50253c3e5296bbeb.png

## ローカルでの動作方法


ruby 2.6.5  
rails 6.0.3.4  

git clone https://github.com/MiyaMasaomi/protospace-33923.git

bundle install  

rails db:migrate  

rails s  
