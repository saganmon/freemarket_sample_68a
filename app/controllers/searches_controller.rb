class SearchesController < ApplicationController
  before_action :set_breadcrumb, :set_data

  def index
    add_breadcrumb "あいまい検索", searches_path
    if get_params == nil
      return nil
    else
      @query = Product.ransack(params[:q])
      @products = Product.keyword_search(get_params)
      @search = Product.new
      @search_word = get_params
    end
  end

  def sort
    add_breadcrumb "並び替え", searches_path
    @products = Product.search_sort_products(gets_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def detail_search
    add_breadcrumb "絞り込み", detail_search_searches_path
    @query = Product.search(get_ransack)
    @query_products = @query.result(distinct: true)
    @search_word = get_ransack_only_name
  end

  def show
    add_breadcrumb "カテゴリー", search_path(params[:id])
    @products = Product.descendants_search(params[:id])
    @search_word = Category.find(params[:id]).name
  end

  def myitem_show
    add_breadcrumb "出品した商品", myitem_show_searches_path
    @products = Product.where(user_id: current_user.id)
    @search_word = current_user.nickname
  end

  private

  def set_data
    @product = Product.new
    @categories = Category.all
  end

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