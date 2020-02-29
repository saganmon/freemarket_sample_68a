class BuysController < ApplicationController

  def new
    @sell = Product.find(params[:sell_id])
    @card = PurchaseCredit.where(user_id: current_user.id)
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      
    else
      Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  def buy #クレジット購入
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @sell = Product.find(params[:sell_id])
     # 購入した際の情報を元に引っ張ってくる
      card = PurchaseCredit.where(user_id: current_user.id).first
     # テーブル紐付けてるのでログインユーザーのクレジットカードを引っ張ってくる
      Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
     # キーをセットする(環境変数においても良い)
      Payjp::Charge.create(
      amount: @sell.price, #支払金額
      customer: card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
     # ↑商品の金額をamountへ、cardの顧客idをcustomerへ、currencyをjpyへ入れる
      if @sell.update(status: "TRUE")
        flash[:notice] = '購入しました。'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: "buys", action: 'new'
      end
     #↑この辺はこちら側のテーブル設計どうりに色々しています
    end
  end

end
