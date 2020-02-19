class SellsController < ApplicationController

  def new
    @sell = Product.new
    @image = Image.new
  end

  def create
    Product.create(product_params)
    Image.create(image_params)
  end

  def show

  end

  private
  def product_params
    params.require(:sell).permit(:name, :description, :category, :brand).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit(:name).merge(product_id: sell.id)
  end


end
