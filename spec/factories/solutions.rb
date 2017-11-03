# frozen_string_literal: true

FactoryBot.define do
  factory :solution do
    user
    challenge
  end
end
