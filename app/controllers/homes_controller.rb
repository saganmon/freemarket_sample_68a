class HomesController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc).limit(3)
    @categories = Category.all
  end
  




end
