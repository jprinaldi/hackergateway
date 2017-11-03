# frozen_string_literal: true

10.times do |i|
  Faq.create(title: "Title #{i}", answer: "Answer #{i}")
end
