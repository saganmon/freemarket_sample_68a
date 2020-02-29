json.array! @shipping_method.each do |method|
  json.id method.id
  json.name method.name
end