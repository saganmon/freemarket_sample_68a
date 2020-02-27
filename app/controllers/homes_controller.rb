class HomesController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc).limit(3)
    @categories =  Category.where(ancestry: nil)
  end

  def search
    @categories = Category.find_category(params[:list_id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
