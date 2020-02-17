class CreateSendDays < ActiveRecord::Migration[5.2]
  def change
    create_table :send_days do |t|
      t.integer      :name
      t.timestamps
    end
  end
end
