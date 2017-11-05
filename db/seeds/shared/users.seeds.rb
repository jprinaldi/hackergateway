# frozen_string_literal: true

ActionMailer::Base.perform_deliveries = false

10.times do |i|
  User.create(
    email: "user#{i}@example.com",
    username: "user#{i}",
    password: "password"
  )
end

ActionMailer::Base.perform_deliveries = true
