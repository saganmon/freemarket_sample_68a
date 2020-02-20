class RemoveSendDatIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :send_day, index: true
  end
end
