class PurchaseDestination < ApplicationRecord
  belongs_to :user, optional: true

  validates :p_last_name, :p_first_name ,:p_first_name_kana,:p_last_name_kana,:p_postcode,
            :p_prefecture, :p_city, :p_block , presence: true

end