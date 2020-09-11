# Title
 Crowis
 
# Outline
 日常の不満や不便を可視化し、
 他者から解決・解消法を意見して貰えるアプリです。
 アプリ名のCrowisはCrowd Wisdom(群衆の知恵)を省略したもので、
 コンセプトは、三人寄れば文殊の知恵です。

# URL
 https://crowis-app.herokuapp.com/
 
# How to Use
 解決・解消したい日常の不満、又は不便を可視化するには、
 ・会員登録→右下の「投稿する」をクリック→不満のタイトルと内容を記述→「投稿する」をクリック
 で投稿が完了します
 
 又、解決・解消してあげる側としてコメントする際は、
 トップページ→コメントしたい投稿をクリック→コメント入力欄に記述→「コメントする」をクリック
 でコメントが完了します

# Purpose
 日常に溢れる不満・不便を解消するためにこのアプリを作成しました。
 一人では解決できない事も、群衆の知恵を集める事で解消する事ができます！
 まさに三人寄れば文殊の知恵です。

# Requirement
| "優先順位
|（高：3、中：2、低：1）"	|機能	|目的	|詳細	|ストーリー(ユースケース)	|見積もり（所要時間）|
|３|	投稿機能 |	不満を目に見える形にするため|	何に関する不満なのか。又その内容を投稿できるようにする|	ボタンを押すと新規投稿ページへ、記述し、ボタンを押すと投稿できる| 2~3時間|	
|３|一覧表示機能|	どのような投稿があるのかわかりやすくするため|	投稿された投稿を一覧表示できるようにする|	投稿された物がトップ画面に新着順に表示される。内容文が長いと省略	2~3時間|
|３|	詳細表示機能|	投稿の全容を表示するため|	投稿内容の全文、投稿に対するコメントなどの詳細を表示する|	一覧の投稿をクリックするとその投稿の情報が全て表示される|	６〜８時間|
|３|	コメント機能|	不満解決のための意見を投稿するため|	投稿された内容にたいして、解決策をコメントできるようにする|	詳細画面下のフォームに記述して投稿ボタンを押すとコメントできる。|８〜１０時間|
|２|	共感機能|	同じ不満を持ってる人の数を把握するため|	ツイッターのいいね機能と同じ機能|	一覧で表示されている投稿の右下にある共感ボタンをおすと共感nと表示されるnは増えていく。投稿１つに対して１ユーザー１回だけ押せる。詳細にも表示する|	６〜８時間|
|３|	ユーザ管理機能|	ユーザを管理するため|	１つのメアドにつき１つのユーザを作成し、アプリを利用できる|	新規登録画面、ログイン画面をし、ログイン状態で画面の表示を変更したり、リンクを踏めなくする。	|６〜８時間|
|３|	編集機能|	文の修正をするため|	自分が投稿した内容を編集できるようにする|	一覧と詳細画面に編集ボタンを実装、押すと編集ページに遷移、更新をおすと内容が更新される。|	４〜６時間|
|３|	削除機能|	投稿を削除するため|	自分の投稿を削除できるようにする|	編集機能と同じ。|	４〜６時間|
|1|	並び替え機能|				
|1|	絞り込み機能|				
|1|	タグ付け機能|				
|1|	報酬機能|				
|1|	通報機能|				
|１|	カテゴリー分け機能|				
|２|	マイページ機能|	自分の投稿したものを管理しやすくするため|	自分が投稿したものだけ一覧で表示する|	マイページボタンを押すと、そのユーザが持っている投稿だけを一覧で表示できる|	４〜６時間|
 
# Explanation
 
 
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

# Author
 
 
# How It Works

