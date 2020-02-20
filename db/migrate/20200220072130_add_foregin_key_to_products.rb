class AddForeginKeyToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :shipping, foreign_key: true
  end
end
