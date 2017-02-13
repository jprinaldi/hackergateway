a = User.create(
  email: "admin@example.com",
  username: "adminx",
  password: "aaaaaaaa"
)
a.add_role :admin

User.create(
  email: "guest@example.com",
  username: "guest",
  password: "aaaaaaaa"
)
