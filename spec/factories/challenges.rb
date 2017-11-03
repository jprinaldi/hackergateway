# frozen_string_literal: true

FactoryBot.define do
  factory :challenge do
    sequence(:name) { |n| "challenge#{n}" }
    body "MyBody"
    answer "MyAnswer"
    category
  end
end
