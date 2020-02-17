class CreateMediumCategorySmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :medium_category_small_categories do |t|
      t.references :medium_category,  foreign_key: true
      t.references :small_category,   foreign_key: true
      t.timestamps
    end
  end
end
