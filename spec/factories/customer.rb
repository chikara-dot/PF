FactoryBot.define do
  factory :customer do
    nickname { Faker::Lorem.characters(number:5) }
    last_name { Faker::Lorem.characters(number:5) }
    last_name_kana { Faker::Lorem.characters(number:5) }
    first_name { Faker::Lorem.characters(number:5) }
    first_name_kana { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end
end