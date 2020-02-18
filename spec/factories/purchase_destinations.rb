FactoryBot.define do
  factory :purchase_destination do
    p_first_name            { Faker::Name.first_name }
    p_last_name             { Faker::Name.last_name }
    p_first_name_kana       { "あべ" }
    p_last_name_kana        { "ひろし" }
    p_postcode              { Faker::Address.postcode }
    p_prefecture            { "福岡県"} 
    p_city                  { "福岡市博多区" }
    p_block                 { "中洲４丁目６−１２" }
    p_building              { "プラート中洲 8F" }
    p_phone_number          { Faker::PhoneNumber.cell_phone }
  end
end
