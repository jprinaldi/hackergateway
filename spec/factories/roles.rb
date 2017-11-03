# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "role#{n}" }
  end
end
