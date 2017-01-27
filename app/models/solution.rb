class Solution < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :challenge, counter_cache: true
  resourcify
end
