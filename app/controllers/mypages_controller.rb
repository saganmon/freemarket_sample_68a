class MypagesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "#{current_user.nickname}さん", mypages_path
    @card = PurchaseCredit.where(user_id: current_user.id)
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      
    else
      Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
    add_breadcrumb "マイページ", :mypages_path
  end
end