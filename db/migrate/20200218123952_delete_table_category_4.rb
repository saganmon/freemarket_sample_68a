class DeleteTableCategory4 < ActiveRecord::Migration[5.2]
  def change
    drop_table :large_categories
  end
end
