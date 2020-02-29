class SearchesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "検索結果", searches_path

    if get_params == nil
      return nil
    else
      @products = Product.keyword_search(get_params)
      @images = @products.map(&:images).flatten
      @search_word = get_params
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

  private

  def get_params
    params.require(:product)[:keyword]
  end

  def gets_params
    params.permit(:keyword, :num)
  end

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
  end

end