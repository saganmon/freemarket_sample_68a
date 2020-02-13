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
|users_id|integer|null: false,foreign_key: true|
|name|string|null :false|
|description|sgring|null :false|
|price|integer|null :false|
|status.id|integer|null :false,foreign_key: true|
|send_priceburden.id|integer|null :false,foreign_key: true|
|send_selfprefecture|string|null :false|
|send_days.id|string|null :false,foreign_key: true|
### Association
 - belongs_to :user
 - has_many :images
 - has_many :products-large_categories
 - has_many :large_categories through: :products-large_categories
 - belongs_to :statu
 - belongs_to :send_priceburden
 - belings_to :send_days


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|products_id|intger|null: false,foreign_key: true|
|image|string|null :false|
### Association
 - belongs_to :product


## products-large_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|products.id|integer|null :false,foreign_key: true,add_index|
|large_categories.id|integer|null :false,foreign_key: true,add_index|
### Association
 - belongs_to :large_category
 - belongs_to :midium_category


## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :products-large_categories
 - has_many :products through: :products-large_categories
 - has_many :large-midium_categories
 - has_many :midium_categories through: :large-midium_categories

## large-midium_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|large_categories.id|integer|null :false,foreign_key: true, add_index|
|midium_categories.id|integer|null :false,foreign_key: true, add_index|
### Association
 - belongs_to :large_category
 - belongs_to :midium_category

## midium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng||
### Association
 - has_many :large-midium_categories
 - has_many :midium_category-sizes
 - has_many :midium_category-brands
 - has_many :midium-small_categories
 - has_many :sizes through: :
 - has_many :brands through : :midium_category-brands

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
 - has_many :midium_category-sizes
 - has_many :midium_category through: :midium_category-sizes

 ## midium_category-brands中間テーブル
|Column|Type|Options|
|------|----|-------|
|midium_categories.id|integer|foreign_key: true|
|brands.id|integer|foreign_key: true|
### Association
 - belongs_to :midium_category
 - belongs_to :brand

 ## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :midium_category-brands
 - has_many :midium_categories through: :midium_category-brands

 ## statusテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :products

 ## send_priceburdensテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :products
 - has_many :send_priceburden-methods
 - has_many :send_methods through: :send_priceburden-methods

 ## send_priceburden-methods中間テーブル
|Column|Type|Options|
|------|----|-------|
|send_priceburdens.id|integer|null :false,foreign_key: true, add_index|
|send_methods.id|integer|null :false,foreign_key: true, add_index|
### Association
 - belong_to :send_priceburden
 - belong_to :send_method

## send_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :send_priceburden-methods
 - has_many :send_priceburdens through: :send_priceburden-methods

## send_daysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :products

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
 