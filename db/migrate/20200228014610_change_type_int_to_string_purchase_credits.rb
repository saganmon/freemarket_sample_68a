class ChangeTypeIntToStringPurchaseCredits < ActiveRecord::Migration[5.2]
  def change
    change_column :purchase_credits, :customer_id,  :string
    change_column :purchase_credits, :card_id,      :string
  end
end
