FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number:5) }
    image_id { Faker::Lorem.characters(number:5) }
  end
end