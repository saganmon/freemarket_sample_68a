FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.email }
    # password                { Faker::Lorem.characters(number:10, min_alpha:7) }
    # password_confirmation   { Faker::Lorem.characters(number:10, min_alpha:7) }
    password                { "aaaaaaa" }
    password_confirmation   { "aaaaaaa" }
    first_name              { Faker::Name.first_name }
    last_name               { Faker::Name.last_name }
    first_name_kana         { "あべ" }
    last_name_kana          { "ひろし" }
    birthday_year           { Faker::Number.between(from: 1900, to: 2020)  } 
    birthday_month          { Faker::Number.between(from: 1, to: 12) }
    birthday_date           { Faker::Number.between(from: 1, to: 31) }
  end
end
