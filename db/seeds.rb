# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.create(
  email: 'admin@example.com',
  username: 'adminx',
  password: 'aaaaaaaa'
)
a.add_role :admin
a.save

u = User.create(
  email: 'guest@example.com',
  username: 'guest',
  password: 'aaaaaaaa'
)
u.add_role :user
u.save

crypto = Category.create(name: 'Cryptography', icon: 'lock')
stegano = Category.create(name: 'Steganography', icon: 'picture-o')

Challenge.create(name: 'Test', body: '<strong>hello, world</strong>', answer: 'testing', category: crypto)
Challenge.create(name: 'Test 2', body: '<em>goodbye, world</em>', answer: 'testing2', category: stegano)
