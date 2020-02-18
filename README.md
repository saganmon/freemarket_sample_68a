## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true, index: true|
|encrypted_password|string|null: false, index: true|
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
|users_id|references|null: false|
|name|string|null :false|
|description|string|null :false|
|price|integer|null :false|
|status_id|references|null :false|
|send_priceburden_id|references|null :false|
|send_selfprefecture|string|null :false|
|send_days_id|references|null :false|
### Association
 - belongs_to :user
 - has_many :images
 - has_many :products-large_categories
 - has_many :large_categories through: :products-large_categories
 - belongs_to :status
 - belongs_to :send_priceburden
 - belings_to :send_days
 - has_many :products-sizes
 - has_manu :sizes through: :products-sizes
 - has_many :products-blands
 - has_manu :sizes through: :products-brands


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|products_id|references|null: false|
|image|string|null :false|
### Association
 - belongs_to :product


## products-large_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|products_id|references|null :false|
|large_categories_id|references|null :false|
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
|large_categories_id|references|null :false|
|midium_categories_id|references|null :false|
### Association
 - belongs_to :large_category
 - belongs_to :midium_category


## midium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng||
### Association
 - has_many :large-midium_categories
 - has_many :large_categories through: :large-midium_categories
 - has_many :midium-small_categories
 - has_many :small_categories through: :midium-small_categories


## midium-small_categories中間テーブル
|Column|Type|Options|
|------|----|-------|
|midium_categories_id|references|null :false|
|small_categories_id|references|null :false|
### Association
 - belong_to :midium_category
 - belong_to :small_category


## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
 - belongs_to :midium-small_category


## products-sizes中間テーブル
|Column|Type|Options|
|------|----|-------|
|products_id|references|null :false|
|sizes_id|references|null :false|
### Association
 - belongs_to :product
 - belongs_to :size


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :midium_category-sizes
 - has_many :midium_category through: :midium_category-sizes


## products-brands中間テーブル
|Column|Type|Options|
|------|----|-------|
|midium_categories_id|references|foreign_key: true|
|brands_id|references|foreign_key: true|
### Association
 - belongs_to :product
 - belongs_to :brand


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :products
 - has_many :midium_categories through: :products


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
|send_priceburdens_id|references|null :false|
|send_methods_id|references|null :false|
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
|users_id|references|null :false|
|credit_number|string|null :false|
|valid_year|integer|null :false|
|valid_month|integer|null :false|
### Association
 - belongs_to :user


## purchase_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|references|null :false|
|p_last_name|string|null :false|
|p_first_name|string|null :false|
|p_first_name_kana|string|null :false|
|p_last_name_kana|string|null :false|
|p_postcode|string|null :false|
|p_prefecture|string|null :false|
|p_city|string|null :false|
|p_block|string|null :false|
|p_building|string||
|p_phone_number|string||
### Association
 - belongs_to :user