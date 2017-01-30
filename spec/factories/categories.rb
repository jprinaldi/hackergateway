FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
    icon "MyIcon"
  end
end
