# frozen_string_literal: true

# This model represents challenge categories
class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :challenges, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
