## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|first_name|string|null :false|
|last_name|string|null :false|
|first_name_kana|string|null :false|
|last_name_kana|string|null :false|
|birthday_year|integer|null :false|
|birthday_month|integer|null :false|
|birthday_date|integer|null :false|
### Association
- has_many :products
- has_many :purchase_credits
- has_many :purchase_destinations


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|reference|foreign_key: true|
|large_categories_id|integer|foreign_key: true|
|name|string|null :false|
|description|sgring|null :false|
|price|integer|null :false|
|status_id|reference|foreign_key: true|
|send_priceburden_id|integer|foreign_key: true|
|send_selfprefecture|string|null :false|
|send_mesthods_id|string|foreign_key: true|
|send_days_id|string|foreign_key: true|
|sizes_id|reference|foreign_key: true|
|brands_id|reference|foreign_key: true|
### Association
 - belongs_to :user
 - has_many :images
 - has_many :products-large_categories
 - belongs_to :large_categories
 - belongs_to :statu
 - belongs_to :send_priceburden
 - belongs_to :send_day
 - belongs_to :size
 - belongs_to :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|products_id|intger|foreign_key: true|
|image|string|null :false|
### Association
 - belongs_to :product


## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :large-midium_categories
 - has_many :midium_categories through: :large-midium_categories
 - belongs_to :product


## large-midium_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|large_categories.id|integer|foreign_key: true, add_index|
|midium_categories.id|integer|foreign_key: true, add_index|
### Association
 - belongs_to :large_category
 - belongs_to :midium_category

## midium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng||
### Association
 - has_many :large-midium_categories
 - has_many :midium-small_categories


 ## midium-small_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|midium_categories.id|integer|null :false,foreign_key: true, add_index|
|small_categories.id|integer|null :false,foreign_key: true, add_index|
### Association
 - belong_to :midium_category
 - belong_to :small_category
 
 ## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
 - belongs_to :midium-small_category

 ## midium_category-sizes中間テーブル
|Column|Type|Options|
|------|----|-------|
|sizes.id|integer|null :false,foreign_key: true, add_index|
|midium_categories.id|integer|null :false,foreign_key: true, add_index|
### Association
 - belongs_to :midium_category
 - belongs_to :size

 ## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - belongs_to :product



 ## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - belongs_to :product

 ## statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - belongs_to :product

 ## send_priceburdensテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - belongs_to :product



## send_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - belongs_to :product

## send_daysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
  - belongs_to :product

 ## purchase_creditsテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|integer|null :false,foreign_key: true|
|credit_number|string|null :false|
|valid_year|integer|null :false|
|valid_month|integer|null :false|
### Association
 - has_many :products

 ## purchase_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|integer|null :false,foreign_key: true|
|last_name|string|null :false|
|first_name|string|null :false|
|first_name_kana|string|null :false|
|last_name_kana|string|null :false|
|postcode|string|null :false|
|prefecture|string|null :false|
|city|string|null :false|
|block|string|null :false|
|building|string||
|phone_number|string||
### Association
 - has_many :products

 