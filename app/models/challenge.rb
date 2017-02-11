class Challenge < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  resourcify

  belongs_to :category, counter_cache: true
  has_many :solutions, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :solvers, through: :solutions, source: :user

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
  validates :answer, presence: true
  validates :category, presence: true

  def check(proposed_answer)
    answer.casecmp(proposed_answer).zero?
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
