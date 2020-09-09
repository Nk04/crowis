# Title
 
 
# Outline
 
 
# URL
 
 
# How to Use
 
 
# Purpose
 
 
# Requirement
 
 
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

