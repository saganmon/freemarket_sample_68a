class MypagesController < ApplicationController
  before_action :set_breadcrumb

  def index
    @card = PurchaseCredit.where(user_id: current_user.id)
    add_breadcrumb "#{current_user.nickname}さん", mypages_path
  end

  private

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
    add_breadcrumb "マイページ", :mypages_path
  end
end