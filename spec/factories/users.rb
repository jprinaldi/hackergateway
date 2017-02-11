FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "User#{n}" }
    password '12345678'

    trait :country_code do
      country_code 'AR'
    end

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
