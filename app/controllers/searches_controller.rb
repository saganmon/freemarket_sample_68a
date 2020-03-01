class SearchesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "検索結果", searches_path

    if get_params == nil
      return nil
    else
      @q = Product.ransack(params[:q])
      @products = Product.keyword_search(get_params)
      @images = @products.map(&:images).flatten
      @search_word = get_params
      @search = Product.new
    end
  end

  def sort
    add_breadcrumb "検索結果", searches_path

    @products = Product.search_sort_products(gets_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def detail_search
    add_breadcrumb "絞り込み結果", detail_search_searches_path

    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    # @products = Product.detail_search(gets_params_again)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def get_params
    params.require(:product)[:keyword]
  end

  def gets_params
    params.permit(:keyword, :num)
  end

  # def gets_params_again
  #   params.permit(:name, :size, :price, :condition, :status)
  # end

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
  end

end