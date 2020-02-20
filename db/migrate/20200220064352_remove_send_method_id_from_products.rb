class RemoveSendMethodIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :send_method, index: true
  end
end
