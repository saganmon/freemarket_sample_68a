json.array! @small_categories.each do |small|
  json.id small.id
  json.name small.name
end