# frozen_string_literal: true

10.times do |i|
  Category.create(name: "Category #{i}")
end
