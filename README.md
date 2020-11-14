## usersテーブル

| Column             | Type       | Options       |
| ------------------ | ---------- | ------------- |
| email              | string     | null: false   |
| encrypted_password | string     | null: false   |
| nickname           | string     | null: false   |
| first_name         | string     | null: false   |
| family_name        | string     | null: false   |
| first_name_kana    | string     | null: false   |
| family_name_kana   | string     | null: false   |
| birthday           | date       | null: false   |

### Association
- has_many : items
- has_many  : order


## itemsテーブル

| Column      | Type       | Options                        |
| ---------   | ---------- | ------------------------------ |
| name        | string     | null: false                    |          
| explanation | text       | null: false                    |
| category_id | integer    | null: false                    |  
| status_id   | integer    | null: false                    |   
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false , foreign_key: true|

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

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |                            
| prefecture_id  | integer    | null: false                    | 
| municipality    | string     | null: false                    | 
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |  
| order           | references | null: false , foreign_key: true| 

## Association
- belongs_to :order