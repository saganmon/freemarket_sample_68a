class CreateSendPriceburdens < ActiveRecord::Migration[5.2]
  def change
    create_table :send_priceburdens do |t|
      t.string      :name
      t.timestamps
    end
  end
end
