class SearchesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "あいまい検索", searches_path
    if get_params == nil
      return nil
    else
      @query = Product.ransack(params[:q])
      @products = Product.keyword_search(get_params)
      @search = Product.new
      @search_word = get_params
      @product = Product.new
    end
  end

  def sort
    add_breadcrumb "並び替え", searches_path
    @product = Product.new
    @products = Product.search_sort_products(gets_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def detail_search
    add_breadcrumb "絞り込み", detail_search_searches_path
    @query = Product.search(get_ransack)
    @product = Product.new
    @query_products = @query.result(distinct: true)
    @search_word = get_ransack_only_name
    @categories = Category.all
  end

  def show
    add_breadcrumb "カテゴリー", search_path(params[:id])
    @product = Product.new
    @products = Product.descendants_search(params[:id])
    @categories = Category.all
    @search_word = Category.find(params[:id]).name
  end

  def myitem_show
    add_breadcrumb "出品した商品", myitem_show_searches_path
    @product = Product.new
    @products = Product.where(user_id: current_user.id)
    @categories = Category.all
    @search_word = current_user.nickname
  end

  private

  def get_params
    params.require(:product)[:keyword]
  end

  def gets_params
    params.permit(:keyword, :num)
  end

  def get_ransack
    params.require(:q).permit(:name_cont, :size_eq, :price_gteq, :price_lt, :condition_eq, :status_eq)
  end

  def get_ransack_only_name
    params.require(:q)[:name_cont]
  end

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
    add_breadcrumb "検索結果", searches_path
  end
end