FactoryBot.define do
  factory :purchase_credit do
    customer_id     { Faker::Number.between(from: 1, to: 100) }
    card_id         { Faker::Number.between(from: 1, to: 100) }
  end
end
