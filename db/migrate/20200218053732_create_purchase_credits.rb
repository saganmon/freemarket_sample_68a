class CreatePurchaseCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_credits do |t|
      t.references  :user,            foreign_key: true
      t.string      :credit_number,   null: false
      t.integer     :valid_year,      null: false
      t.integer     :valid_month,     null: false
      t.timestamps
    end
  end
end
