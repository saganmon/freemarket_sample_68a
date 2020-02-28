class CardsController < ApplicationController


  require "payjp"

  def new
    card = PurchaseCredit.where(user_id: current_user.id)
    redirect_to card_path(card) if card.exists?
  end

  def pay #クレジットカード登録
    Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
    # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
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
        redirect_to mypages_path
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def show
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_fc70de572b91d952622fced6"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy
    card = PurchaseCredit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_fc70de572b91d952622fced6'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
     #ここでpay.jpの方を消している
      card.delete
     #ここでテーブルにあるcardデータを消している
    end  
end


end