# This model represents challenge categories
class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  resourcify

  has_many :challenges

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
