class Challenge < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  resourcify

  belongs_to :category
  has_many :solutions, dependent: :destroy
  has_many :solvers, through: :solutions, source: :user

  def should_generate_new_friendly_id?
    name_changed?
  end
end
