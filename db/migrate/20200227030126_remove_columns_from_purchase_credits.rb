class RemoveColumnsFromPurchaseCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :purchase_credits, :credit_number,  :string
    remove_column :purchase_credits, :valid_year,     :integer
    remove_column :purchase_credits, :valid_month,    :integer
  end
end
