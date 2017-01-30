FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    country "AR"
    password "123456"

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :confirmed do
      after(:create) { |user| user.confirm }
    end
  end
end
