class CreatePurchaseDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_destinations do |t|
      t.references :user
      t.string :p_last_name,        null: false
      t.string :p_first_name,       null: false
      t.string :p_first_name_kana,  null: false
      t.string :p_last_name_kana,   null: false
      t.string :p_postcode,         null: false
      t.string :p_prefecture,       null: false
      t.string :p_city,             null: false
      t.string :p_block,            null: false
      t.string :p_building
      t.string :p_phone_number
      t.timestamps
    end
  end
end
