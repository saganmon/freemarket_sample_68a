class SellsController < ApplicationController

  def new
    @sell = Product.new
    @image = Image.new
    @categories = Category.all
    @shippings = Shipping.all
    @sell.images.new
  end

  def create
    Product.create!(product_params)
    # Image.create(image_params)
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

  def select_category_small
    @small_categories = Category.find(params[:keyword]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def select_shipping_method
    @shipping_method = Shipping.where(ancestry: params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :shipping_id, :shipping_where, :shipping_day, :price, :condition).merge(user_id: current_user.id)
  end

  # def image_params
  #   params.require(:product).require(:image).merge(product_id: sell.id)
  # end


end
