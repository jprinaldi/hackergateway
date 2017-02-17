ActionMailer::Base.perform_deliveries = false

a = User.create(
  email: "admin@example.com",
  username: "juampi",
  password: "password"
)
a.add_role :admin

10.times do |i|
  User.create(
    email: "guest#{i}@example.com",
    username: "guest#{i}",
    password: "password"
  )
end

ActionMailer::Base.perform_deliveries = true
