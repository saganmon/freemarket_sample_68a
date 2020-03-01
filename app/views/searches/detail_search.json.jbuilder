json.array! @products.each do |product|
  json.name product.name
  json.price product.price
  json.image product.images.first.name.to_s
end