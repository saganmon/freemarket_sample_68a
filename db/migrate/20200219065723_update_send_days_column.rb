class UpdateSendDaysColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :send_days, :name, :string
  end
end

