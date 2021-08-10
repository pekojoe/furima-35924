FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    family_name_kana      { japanese_user.last.katakana }
    first_name_kana       { japanese_user.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
