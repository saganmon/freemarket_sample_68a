class Product < ApplicationRecord
  belongs_to  :user
  has_many    :images, dependent: :delete_all
  belongs_to  :category
  belongs_to  :shipping
  belongs_to  :brand, optional: true

  validates :name, :description, :category_id, :condition, :shipping_id, :shipping_where, :shipping_day, :price, presence: true
  validates :price, numericality: { only_integer: true , greater_than: 300, less_than: 9999999}

  enum condition: [:brand_new, :almost_new, :nothing_damage, :little_damage, :damage, :awful]
  enum shipping_where: [:HOKKAIDO, :AOMORI, :IWATE, :MIYAGI, :AKITA, :YAMAGATA, :FUKUSHIMA, :IBARAKI, :TOCHIGI, :GUNMA, :SAITAMA, :CHIBA, :TOKYO, :KANAGAWA, :NIIGATA, :TOYAMA, :ISHIKAWA, :FUKUI, :YAMANASHI, :NAGANO, :GIFU, :SHIZUOKA, :AICHI, :MIE, :SHIGA, :KYOTO, :OSAKA, :HYOGO, :NARA, :WAKAYAMA, :TOTTORI, :SHIMANE, :OKAYAMA, :HIROSHIMA, :YAMAGUCHI, :TOKUSHIMA, :KAGAWA, :EHIME, :KOCHI, :FUKUOKA, :SAGA, :NAGASAKI, :KUMAMOTO, :OITA, :MIYAZAKI, :KAGOSHIMA, :OKINAWA]
  enum shipping_day: [:within_two_days, :within_three_days, :within_four_days]
  enum size: [:under_xxs, :xs, :small, :medium, :large, :xl, :xxl, :xxxl, :over_xxxxl, :free]

  def self.keyword_search(keyword)
    if keyword == ""
      return nil
    else
      Product.where('name LIKE (?)', "%#{keyword}%")
    end
  end

  def self.search_sort_products(params)
    case params[:num]
    when '1'
      Product.where('name LIKE (?)', "%#{params[:keyword]}%").order("price ASC")
    when '2'
      Product.where('name LIKE (?)', "%#{params[:keyword]}%").order("price DESC")
    when '3'
      Product.where('name LIKE (?)', "%#{params[:keyword]}%").order("created_at DESC")
    end
  end
end