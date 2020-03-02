class PurchaseCredit < ApplicationRecord
  belongs_to :user
  validates :customer_id, :card_id, presence: true
end
