class DeleteTableCategory < ActiveRecord::Migration[5.2]
  def change
    drop_table :large_category_medium_categories
  end
end




