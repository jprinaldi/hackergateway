# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.username = 'guest'
u.email = 'guest@example.com'
u.password = 'aaaaaa'
u.add_role :user
u.confirm
u.save

a = User.new
a.username = 'admin'
a.email = 'admin@example.com'
a.password = 'aaaaaa'
a.add_role :admin
a.confirm
a.save

crypto = Category.create(name: 'Cryptography', icon: 'lock')
stegano = Category.create(name: 'Steganography', icon: 'picture-o')

Challenge.create(name: 'Test', body: '<strong>hello, world</strong>', answer: 'testing', category: crypto)
Challenge.create(name: 'Test 2', body: '<em>goodbye, world</em>', answer: 'testing2', category: stegano)
