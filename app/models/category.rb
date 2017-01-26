class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  resourcify

  has_many :challenges

  def should_generate_new_friendly_id?
    name_changed?
  end
end
