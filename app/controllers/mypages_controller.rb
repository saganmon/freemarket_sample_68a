class MypagesController < ApplicationController

  def index
    @card = PurchaseCredit.where(user_id: current_user.id)
  end
end
