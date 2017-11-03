# frozen_string_literal: true

json.array! @challenges, partial: "challenges/challenge", as: :challenge
