FactoryGirl.define do
  factory :challenge do
    sequence(:name) { |n| "challenge#{n}" }
    body 'MyBody'
    answer 'MyAnswer'
    category
  end
end
