class CardsController < ApplicationController

  before_action :set_card,only: [:new, :show, :destroy]
  require "payjp"

  def new
    card = PurchaseCredit.where(user_id: current_user.id)
    redirect_to card_path(card) if card.exists?
  end

  def pay #クレジットカード登録
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
    card = PurchaseCredit.where(user_id: current_user.id).first
    if params['payjpToken'].blank?
    # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
      )
      # ↑ここでjay.jpに保存
      @card = PurchaseCredit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      # ここでdbに保存
      if @card.save
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def show
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      flash[:notice] = 'カード情報の登録されていません'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
     #ここでpay.jpの方を消している
      card.delete
     #ここでテーブルにあるcardデータを消している
    end  
  end

  private
  def set_card
    card = PurchaseCredit.where(user_id: current_user.id)
  end

end