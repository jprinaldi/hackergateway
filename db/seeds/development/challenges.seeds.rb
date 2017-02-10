after 'development:categories' do
  crypto = Category.find_by_name('Cryptography')
  stegano = Category.find_by_name('Steganography')
  crypto.challenges.create(
    name: 'Test',
    body: '<strong>hello, world</strong>',
    answer: 'testing'
  )
  stegano.challenges.create(
    name: 'Test 2',
    body: '<em>goodbye, world</em>',
    answer: 'testing2'
  )
end
