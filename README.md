## usersテーブル

| Column             | Type       | Options       |
| ------------------ | ---------- | ------------- |
| email              | string     | null: false   |
| encrypted_password | string     | null: false   |
| name               | string     | null: false   |
| first name         | string     | null: false   |
| family name        | string     | null: false   |
| first name kana    | string     | null: false   |
| family name kana   | string     | null: false   |
| birthday           | date       | null: false   |

### Association
- has_many : items
- has_many  : order


## itemsテーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string     | null: false                    |          
| explanation| text       | null: false                    |
| category   | integer    | null: false                    |    
| status     | integer    | null: false                    |   
| burden     | integer    | null: false                    |
| area       | integer    | null: false                    |
| days       | integer    | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false , foreign_key: true|

### Association
- belongs_to :user
- has_one    :order



## orderテーブル ##買ったもの、売ったものを保存するテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false , foreign_key: true|                            
| item       | references | null: false , foreign_key: true|                    

### Association
- belongs_to :item
- has_one    :address
- belongs_to :user




## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal code   | string     | null: false                    |                            
| prefectures   | integer    | null: false                    | 
| municipality  | string     | null: false                    | 
| house number  | string     | null: false                    |
| building name | string     | null: false                    |
| phone number  | string     | null: false                    |  
| order         | references | null: false , foreign_key: true| 

## Association
- belongs to order