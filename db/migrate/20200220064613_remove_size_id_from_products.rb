class RemoveSizeIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :size, index: true
  end
end
