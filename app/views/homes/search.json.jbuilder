json.array! @categories.each do |list|
  json.id list.id
  json.name list.name
end