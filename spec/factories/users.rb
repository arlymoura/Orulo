# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { '12345678' }

    trait :with_favorites do
      favorite_buildings { { "ids": %w[1 2 3] } }
    end

    factory :user_with_favorites, traits: [:with_favorites]
  end
end
