class MediumCategory < ApplicationRecord
  has_many :large_categories
  has_many :medium_category_small_categories
  has_many :small_categories, through: :medium_category_small_categories
end
