class DeleteTableCategory3 < ActiveRecord::Migration[5.2]
  def change
    drop_table :small_categories
    drop_table :medium_categories
  end
end
