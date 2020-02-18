class Product < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :large_category
  belongs_to :status
  belongs_to :send_method
  belongs_to :send_priceburden
  belongs_to :send_day
  belongs_to :size
  belongs_to :brand
end