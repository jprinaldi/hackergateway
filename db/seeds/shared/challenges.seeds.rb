# frozen_string_literal: true

after "shared:categories" do
  categories = Category.all
  categories.each do |category|
    5.times do |i|
      category.challenges.create(
        name: "#{category.name} challenge #{i}",
        body: "body",
        answer: "answer"
      )
    end
  end
end
