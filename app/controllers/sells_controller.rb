class SellsController < ApplicationController

  def new
    @sell = Product.new
    @image = Image.new
    @categories = Category.all
  end

  def create
    Product.create(product_params)
    Image.create(image_params)
  end

  def show
    @sell = Product.find(params[:id])
  end

  def edit
    @child_categories = Category.where(ancestry: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end


  def destroy
    sell = Product.find(params[:id])
    if sell.destroy
    unless
      flash.now[:alert] = '削除は完了していません。'
      respond_to sell_path(sell)
    end
  end
  
  private
  def product_params
    params.require(:sell).permit(:name, :description, :category, :brand).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit(:name).merge(product_id: sell.id)
  end


end
