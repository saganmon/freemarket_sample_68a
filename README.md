## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true, index: true|
|password|string|null: false, unique: true, index: true|
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
|large_categories_id|reference|foreign_key: true|
|name|string|null :false|
|description|sgring|null :false|
|price|integer|null :false|
|status_id|reference|foreign_key: true|
|send_priceburden_id|reference|foreign_key: true|
|send_selfprefecture|string|null :false|
|send_methods_id|reference|foreign_key: true|
|send_days_id|string|foreign_key: true|
|sizes_id|reference|foreign_key: true|
|brands_id|reference|foreign_key: true|
### Association
 - belongs_to :user
 - has_many :images
 - belongs_to :products-large_categories
 <!-- - belongs_to :large_categories -->
 - belongs_to :status
 - belongs_to :send_priceburden
 - belongs_to :send_day
 - belongs_to :size
 - belongs_to :brand


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|products_id|reference|foreign_key: true|
|image|string|null :false|
### Association
 - belongs_to :product


## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
### Association
 - has_many :large-medium_categories
 - has_many :medium_categories through: :large-medium_categories
 - belongs_to :product


## large_category-midium_category中間テーブル
|Column|Type|Options|
|------|----|-------|
|large_category_id|reference|foreign_key: true|
|medium_category_id|reference|foreign_key: true|
### Association
 - belongs_to :large_category
 - belongs_to :medium_category

## medium_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|stirng||
### Association
 - has_many :small_categories through: :medium-small_categories
 - has_many :large_categories through: :large-medium_categories
 - has_many :large-medium_categories
 - has_many :medium-small_categories


 ## medium_category-small_category中間テーブル
|Column|Type|Options|
|------|----|-------|
|medium_category_id|reference|foreign_key: true|
|small_category_id|reference|foreign_key: true|
### Association
 - belong_to :medium_category
 - belong_to :small_category
 
 ## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
### Association
 - has_many :medium-small_categories
 - has_many :medium_categories through ::medium-small_categories


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
|users_id|reference|foreign_key: true|
|credit_number|string|null :false|
|valid_year|integer|null :false|
|valid_month|integer|null :false|
### Association
  - belongs_to :user


 ## purchase_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|reference|foreign_key: true|
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
 