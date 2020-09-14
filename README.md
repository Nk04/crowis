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
**投稿テストのdemo動画です**
 ![投稿テスト](https://user-images.githubusercontent.com/68424329/92883743-2265a500-f44c-11ea-99bd-4a5932ec6a5a.gif)

**コメント投稿のdemo動画です。gemを使ってURLを自動認識してリンクにし、飛べるようにしてます**
 ![コメント投稿テスト](https://user-images.githubusercontent.com/68424329/92883473-d4e93800-f44b-11ea-9cb7-54944eed5e30.gif)

**共感機能(いいね機能)のdemo動画です。最後のはちょっとお洒落にしようと導入したハンバガーメニューです。**
 ![いいね機能とハンバーガーメニュー](https://user-images.githubusercontent.com/68424329/92884744-18907180-f44d-11ea-9f48-4d1235ef4798.gif)
 
# Ingenuity
 部分テンプレートを多用したり、簡潔なコメントアウトを心がけてコードを出来る限り見やすくしました。
 一度発生したエラーはメモにとり、コードの働きの再認識と同じ、又は似たようなエラーが発生した際にスムーズにかいけつできるようにしました。
 ハンバーガーメニューを導入したりレイアウトを少しこだわったりとプログラミングを楽しみながら開発しました。
 
 
# Development Environment
 Ruby/Ruby on Rails/Html・Css/JavaScript/Mysql
 
# To Be Implemented
 セキュリティーが甘いので、ネットで検索し、学習して取り入れようと思います
 追加の機能については、タグ付け機能、検索機能、カテゴリー分け機能の実装。
 また画面サイズの縮小によるレイアウトの崩れも修正していきたいと考えています
 
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

