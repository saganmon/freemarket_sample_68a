class RemoveSendPriceburdenIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :send_priceburden, index: true
  end
end
