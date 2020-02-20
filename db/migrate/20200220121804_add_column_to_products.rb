class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :condition,       :integer, null: false
    add_column :products, :shipping_where,  :integer, null: false
    add_column :products, :shipping_day,    :integer, null: false
    add_column :products, :size,            :integer
    add_column :products, :status,          :boolean, null: false, default: false
  end
end
