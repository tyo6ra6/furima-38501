# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birthday           | date                | null: false               |


### Association

* has_many :items
* has_many :purchases

## items table

| Column           | Type       | Options                        |
|----------------- |------------|--------------------------------|
| item_name        | string     | null: false                    |
| category_id      | integer    | null: false                    |
| condition        | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| shipping_payer   | string     | null: false                    |
| area             | string     | null: false                    |
| take_time        | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one: purchase
- belongs_to :user

## purchases table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one: address


## addresses table

| Column        | Type          | Options                        |
|-------------- |-------------- |--------------------------------|
| post_code     | string        | null: false                    |
| prefecture_id | integer       | null: false                    |
| city          | string        | null: false                    |
| house_number  | string        | null: false                    |
| number        | string        | null: false                    |
| purchase      | references    | null: false, foreign_key: true |


### Association

- belongs_to :purchase




