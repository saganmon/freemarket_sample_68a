class Product < ApplicationRecord
  belongs_to  :user
  has_many    :images
  belongs_to  :category
  belongs_to  :shipping
  belongs_to  :brand

  enum condition: [:brand_new, :almost_new, :nothing_damage, :little_damage, :damage, :awful]
  enum shipping_where: [:HOKKAIDO, :AOMORI, :IWATE, :MIYAGI, :AKITA, :YAMAGATA, :FUKUSHIMA, :IBARAKI, :TOCHIGI, :GUNMA, :SAITAMA, :CHIBA, :TOKYO, :KANAGAWA, :NIIGATA, :TOYAMA, :ISHIKAWA, :FUKUI, :YAMANASHI, :NAGANO, :GIFU, :SHIZUOKA, :AICHI, :MIE, :SHIGA, :KYOTO, :OSAKA, :HYOGO, :NARA, :WAKAYAMA, :TOTTORI, :SHIMANE, :OKAYAMA, :HIROSHIMA, :YAMAGUCHI, :TOKUSHIMA, :KAGAWA, :EHIME, :KOCHI, :FUKUOKA, :SAGA, :NAGASAKI, :KUMAMOTO, :OITA, :MIYAZAKI, :KAGOSHIMA, :OKINAWA]
  enum shipping_day: [:within_two_days, :within_three_days, :within_four_days]
  enum size: [:under_xxs, :xs, :small, :medium, :large, :xl, :xxl, :xxxl, :over_xxxxl, :free]
end