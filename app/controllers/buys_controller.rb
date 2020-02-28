class BuysController < ApplicationController

  def new
    @card = PurchaseCredit.where(user_id: current_user.id)
  end

  def create
    
  end
end
