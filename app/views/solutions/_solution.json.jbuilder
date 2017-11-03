# frozen_string_literal: true

json.extract! solution, :user, :challenge
json.user solution.user.username
json.challenge solution.challenge.slug
