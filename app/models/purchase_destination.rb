class PurchaseDestination < ApplicationRecord
  belongs_to :user, optional: true

  VALID_POSTALCODE_REGEX =   /\A\d{3}[-]\d{4}\z/

  validates :p_last_name, :p_first_name ,:p_first_name_kana,:p_last_name_kana,:p_postcode,
            :p_prefecture, :p_city, :p_block , presence: true
  validates :p_postcode, format:  { with: VALID_POSTALCODE_REGEX }
end