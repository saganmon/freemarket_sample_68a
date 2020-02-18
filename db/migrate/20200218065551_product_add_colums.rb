class ProductAddColums < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :user, foreign_key: true
    add_reference :products, :large_category, foreign_key: true
    add_reference :products, :status, foreign_key: true
    add_reference :products, :send_priceburden, foreign_key: true
    add_reference :products, :send_method, foreign_key: true
    add_reference :products, :send_day, foreign_key: true
    add_reference :products, :size, foreign_key: true
    add_reference :products, :brand, foreign_key: true
  end
end
