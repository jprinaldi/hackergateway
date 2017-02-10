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

crypto = Category.create(name: 'Cryptography')
stegano = Category.create(name: 'Steganography')

Challenge.create(name: 'Test', body: '<strong>hello, world</strong>', answer: 'testing', category: crypto)
Challenge.create(name: 'Test 2', body: '<em>goodbye, world</em>', answer: 'testing2', category: stegano)

Faq.create(
  title: 'Are CAPTCHAs part of the challenges?',
  answer: 'No. CAPTCHAs are there to prevent users from guessing the answers via brute-force. You are not expected to bypass them.'
)

Faq.create(
  title: 'How can I change my profile picture?',
  answer: 'We use the Gravatar service to show profile images, so you should do it over there.'
)
