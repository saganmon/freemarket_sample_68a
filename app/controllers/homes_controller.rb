class HomesController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc).limit(3)
    # @products = Product.all.order(created_at: :desc).limit(3)


  end
  
end
