class RemoveStatusIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :status, index: true
  end
end
