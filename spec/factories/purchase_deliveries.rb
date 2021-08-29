FactoryBot.define do
  factory :purchase_delivery do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌市北区' }
    address { '5丁目' }
    building_name { '北大ハイツ' }
    phone_number { '09012345678' }
  end
end
