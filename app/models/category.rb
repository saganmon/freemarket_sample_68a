class Category < ApplicationRecord
  has_many :products
  has_ancestry

  def self.find_category(id)
    if id == "0"
      @categories = Category.where(ancestry: nil)  #大カテゴリ抽出
    elsif Category.find(id).ancestry == nil
      @categories = Category.where(ancestry: id)  #中カテゴリ抽出
    else
      @categories = Category.find(id).children  #小カテゴリ抽出
    end
  end
end
