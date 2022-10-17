# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| birthday           | string              | null: false               |


### Association

* has_many :items
* has_many :purchases

## items table

| Column           | Type       | Options                        |
|----------------- |------------|--------------------------------|
| item_name        | string     | null: false                    |
| category         | string     | null: false                    |
| image            | string     | null: false                    |
| text             | text       | null: false                    |
| price            | integer    | null: false                    |
| shipping_payer   | string     | null: false                    |
| area             | string     | null: false                    |
| take_time        | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

* has_many :purchases
- belongs_to :user

## purchases table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one: address


## address table

| Column        | Type          | Options                        |
|-------------- |-------------- |--------------------------------|
| post_code     | integer       | null: false                    |
| prefecture    | string        | null: false                    |
| city          | string        | null: false                    |
| house_number  | integer       | null: false                    |
| number        | integer       | null: false                    |
| purchase      | references    | null: false, foreign_key: true |


### Association

- belongs_to :purchase




