FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    country_code "AR"
    password "12345678"

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :confirmed do
      after(:create) { |user| user.confirm }
    end
  end
end
