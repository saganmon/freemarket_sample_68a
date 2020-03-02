require 'rails_helper'

describe PurchaseCredit do
  before do
    @user = FactoryBot.create(:user)
  end

  it "お客様番号とカード番号がある場合、有効である" do
    user = @user
    purchase_credit = build(:purchase_credit, user_id: user.id)
    expect(purchase_credit).to be_valid
  end

  it "お客様番号がない場合、無効である" do
    user = @user
    purchase_credit = build(:purchase_credit,user_id: user.id, customer_id: nil, card_id: "111")
    purchase_credit.valid?
    expect(purchase_credit.errors[:customer_id]).to include("を入力してください")
  end

  it "カード番号がない場合、無効である" do
    user = @user
    purchase_credit = build(:purchase_credit,user_id: user.id, customer_id: "111", card_id: nil)
    purchase_credit.valid?
    expect(purchase_credit.errors[:card_id]).to include("を入力してください")
  end
end
