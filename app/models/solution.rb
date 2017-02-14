class Solution < ApplicationRecord # :nodoc:
  belongs_to :user, counter_cache: true
  belongs_to :challenge, counter_cache: true
  resourcify

  validates :user, presence: :true
  validates :challenge, presence: :true
  validates :user, uniqueness: {
    scope: :challenge, message: "has already solved this challenge"
  }
end
