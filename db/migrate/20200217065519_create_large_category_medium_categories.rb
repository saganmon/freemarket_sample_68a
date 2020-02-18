class CreateLargeCategoryMediumCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_category_medium_categories do |t|
      t.references :large_category,   foreign_key: true
      t.references :medium_category,  foreign_key: true
      t.timestamps
    end
  end
end
