class DeleteTableCategory2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :medium_category_small_categories
  end
end
