class MediumCategorySmallCategory < ApplicationRecord
  belongs_to :medium_category
  belongs_to :small_category
end
