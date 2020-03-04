class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_breadcrumb

  def index
    add_breadcrumb "#{current_user.nickname}さん", mypages_path
    @card = PurchaseCredit.where(user_id: current_user.id)
    card = PurchaseCredit.where(user_id: current_user.id).first
    @destination = PurchaseDestination.where(user_id: current_user.id)
    if card.blank?
      flash[:alert] = '商品購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      @product = Product.new
    end
  end


  def edit
    @purchase_destination = PurchaseDestination.find_by(user_id: current_user.id)
  end

  def update
    @purchase_destination = PurchaseDestination.find_by(user_id: current_user.id)
    @purchase_destination.update(destination_params)
  end


  private

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
    add_breadcrumb "マイページ", :mypages_path
  end

  def destination_params
    params.require(:purchase_destination).permit(:p_last_name, :p_first_name, :p_first_name_kana, :p_last_name_kana, :p_postcode, :p_prefecture, :p_city, :p_block, :p_building, :p_phone_number).merge(user_id: current_user.id)
  end
end