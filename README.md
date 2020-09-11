# Title
 Crowis
 
# Outline
 日常の不満や不便を可視化し、
 他者から解決・解消法を意見して貰えるアプリです。
 アプリ名のCrowisはCrowd Wisdom(群衆の知恵)を省略したもので、
 コンセプトは、三人寄れば文殊の知恵です。

# URL
 https://crowis-app.herokuapp.com/
 
# Purpose
 日常に溢れる不満・不便を解消するためにこのアプリを作成しました。
 一人では解決できない事も、群衆の知恵を集める事で解消する事ができます！
 まさに三人寄れば文殊の知恵です。

# Demo
 ![コメント投稿テスト](https://user-images.githubusercontent.com/68424329/92883473-d4e93800-f44b-11ea-9cb7-54944eed5e30.gif)

 ![投稿テスト](https://user-images.githubusercontent.com/68424329/92883743-2265a500-f44c-11ea-99bd-4a5932ec6a5a.gif)

 ![いいね機能とハンバーガーメニュー](https://user-images.githubusercontent.com/68424329/92884744-18907180-f44d-11ea-9f48-4d1235ef4798.gif)

 
# Ingenuity
 
 
# Development Environment
 
 
# To Be Implemented
 
 
# Database Design

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nick_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association
- has_many :complaints
- has_many :comments
- has_many :empathy

## complaints テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :comments, dependent: :destroy
- has_many   :empathy,  dependent: :destroy

## empathy テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| complaint | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :complaint

## comment テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| complaint | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :complaint

