class HomesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "Top", root_path

    @product = Product.new
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

  private

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
  end

end
