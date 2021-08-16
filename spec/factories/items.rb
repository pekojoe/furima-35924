FactoryBot.define do
  factory :item do
    item_name     { 'hoge' }
    description   { Faker::Lorem.sentence }
    category_id   { 2 }
    status_id     { 2 }
    burden_id     { 2 }
    prefecture_id { 2 }
    schedule_id   { 2 }
    price         { 9999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
