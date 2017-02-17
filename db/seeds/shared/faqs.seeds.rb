10.times do |i|
  Faq.create(title: "Title #{i}", answer: "Answer #{i}")
end
