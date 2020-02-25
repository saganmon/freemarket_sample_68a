product_1 = Product.create(
  name: 'クッキー',
  description: '手作りです',
  price: 3999,
  user_id: 1,
  brand_id: 1,
  category_id: 234,
  shipping_id: 5,
  condition: 2,
  shipping_where: 6,
  shipping_day: 1,
  size: 1,
  status: 1,
)

product_2 = Product.create(
  name: 'カボチャ',
  description: 'カボチャです',
  price: 1200,
  user_id: 1,
  brand_id: 1,
  category_id: 134,
  shipping_id: 3,
  condition: 2,
  shipping_where: 2,
  shipping_day: 1,
  size: 4,
  status: 2,
)

product_3 = Product.create(
  name: 'フルーツ飴',
  description: '飴です',
  price: 299,
  user_id: 2,
  brand_id: 1,
  category_id: 125,
  shipping_id: 10,
  condition: 2,
  shipping_where: 6,
  shipping_day: 1,
  size: 1,
  status: 1,
)
