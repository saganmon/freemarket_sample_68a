class RemoveSendSellprefectureFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :send_sellprefecture, :string
  end
end
