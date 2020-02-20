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

  end

  def edit

  end

  def select_category_middle
    @middle_categories = Category.where(ancestry: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end

  end

  def select_category_small
    @small_categories = Category.find(params[:keyword]).children
    respond_to do |format|
      format.html
      format.json
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
