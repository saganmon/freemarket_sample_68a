class BuysController < ApplicationController

  def new
    @card = PurchaseCredit.where(user_id: current_user.id)
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      
    else
      Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def create
    
  end
end
