json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.status product.status
  json.image product.images.first.name.to_s
end