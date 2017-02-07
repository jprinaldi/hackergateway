class Solution < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :challenge, counter_cache: true
  resourcify

  validates :user, presence: :true
  validates :challenge, presence: :true
end
