FactoryBot.define do
  factory :product do
    sequence(:name)           {Faker::Lorem.word}
    sequence(:description)    {Faker::Lorem.sentence}
    sequence(:price)          {Faker::Number.between(from: 300, to: 9999999)}
    sequence(:condition)      {Faker::Number.between(from: 0, to: 4)}
    sequence(:shipping_where) {Faker::Number.between(from: 0, to: 46)}
    sequence(:shipping_day)   {Faker::Number.between(from: 0, to: 2)}
    sequence(:size)           {Faker::Number.between(from: 0, to: 9)}    
  end
end
