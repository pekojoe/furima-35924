FactoryBot.define do
  factory :purchase_delivery do
    card_number { 4242424242424242 }
    month { 3 }
    year { 25 }
    cvc { 123 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌市北区' }
    address { '5丁目' }
    building_name { '北大ハイツ' }
    phone_number { '09012345678' }    
  end
end
