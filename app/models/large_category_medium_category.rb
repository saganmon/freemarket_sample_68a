class LargeCategoryMediumCategory < ApplicationRecord
  belongs_to :large_category
  belongs_to :medium_category
end
