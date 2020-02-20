class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string      :name
      t.string      :ancestry
      t.timestamps
    end
    add_index :shippings, :name
    add_index :shippings, :ancestry
  end
end