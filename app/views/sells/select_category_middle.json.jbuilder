json.array! @middle_categories.each do |middle|
  json.id middle.id
  json.name middle.name
end