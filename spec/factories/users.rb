FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    
    trait :with_favorites do
      favorite_buildings {{"ids": ["1", "2", "3"]} }
    end
   
    factory :user_with_favorites, traits: [:with_favorites]
  end
end