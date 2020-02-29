class SearchesController < ApplicationController
  before_action :set_breadcrumb

  def index
    add_breadcrumb "検索結果", searches_path

    if params[:keyword] == ""
      return nil
    else
      @products = Product.keyword_search(get_params)
      @images = @products.map(&:images).flatten
    end
  end

  private

  def get_params
    params.require(:product)[:keyword]
  end

  def set_breadcrumb
    add_breadcrumb "フリマ", :root_path
  end

end