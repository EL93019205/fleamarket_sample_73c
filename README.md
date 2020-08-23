<img width="1174" alt="DB" src="https://user-images.githubusercontent.com/59168351/90976401-b80dc300-e577-11ea-9fb1-e650f676cc0b.png">

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string||
|category|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|condition|integer|null: false|
|trading_status|integer|null: false|
|shipping_area|integer|null: false|
|shipping_days|integer|null: false|
|shipping_price|integer|null: false|
### Association
- has_many :purchases
- has_many :images, dependent: :destroy
- belongs_to :user, dependent: :destroy
- belongs_to :category

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|encrypted_password|string|null: false|
|email|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|d_family_name|string|null: false|
|d_first_name|string|null: false|
|d_familiy_name_kana|string|null: false|
|d_first_name_kana|string|null: false|
|zipcode|varchar(7)|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|varchar(11)||
### Association
- has_one :credit, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :purchases

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null:false|
|customer_id|string|null:false|
|user|references|null:false, uinque: ture, foreign_key:true|
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null:false, foreign_key:true|
|src|string|null:false|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||
### Association
- has_many :items
