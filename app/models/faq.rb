# This model represents frequently asked questions (FAQs)
class Faq < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
end
