class AddColumnsToPurchaseCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_credits, :customer_id, :integer,  null: false
    add_column :purchase_credits, :card_id,     :integer,  null: false
  end
end
