class RemoveStatusFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :status, :boolean
  end
end
