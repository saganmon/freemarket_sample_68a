class LargeCategory < ApplicationRecord
  has_many :products
  has_many :large_category_medium_categories
  has_many :medium_categories, through: :large_category_medium_categories
end
