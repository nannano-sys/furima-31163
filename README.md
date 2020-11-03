## usersテーブル

| Column    | Type       | Options       |
| ----------| ---------- | ------------- |
| email     | string     | null: false   |
| password  | string     | null: false   |
| name      | string     | null: false   |
| real name | string     | null: false   |
| furigana  | string     | null: false   |
| birthday  | string     | null: false   |

### Association
- has_many : items


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
| price      | string     | null: false                    |
| user_id    | references | null: false , foreign_key: true|

### Association
- belongs_to :user
- has one    :order


## orderテーブル ##買ったもの、売ったものを保存するテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |　
| user_id    | references | null: false , foreign_key: true|                            
| item_id    | references | null: false , foreign_key: true|                    



### Association
- belongs to item
- has one address
- belongs to user


## addressテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| order_id   | references | null: false , foreign_key: true|                            

### Association
- belongs to order