class Delete5Tables < ActiveRecord::Migration[5.2]
  def change
    drop_table :statuses
    drop_table :send_priceburdens
    drop_table :send_methods
    drop_table :send_days
    drop_table :sizes
  end
end
