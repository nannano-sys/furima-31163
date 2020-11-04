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
- has_one  : order


## itemsテーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| name       | string     | null: false                    |          
| explanation| text       | null: false                    |
| category   | string     | null: false                    |    
| status     | string     | null: false                    |   
| burden     | string     | null: false                    |
| area       | string     | null: false                    |
| days       | string     | null: false                    |
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
| Postal code   | integer    | null: false                    |                            
| Prefectures   | string     | null: false                    | 
| Municipality  | string     | null: false                    | 
| house number  | string     | null: false                    |
| Building name | string     | null: false                    |
| phone number  | integer    | null: false                    |  
| order         | references | null: false , foreign_key: true| 

## Association
- belongs to order