# frozen_string_literal: true

class Challenge < ApplicationRecord # :nodoc:
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category, counter_cache: true
  has_many :solutions, dependent: :destroy
  has_many :solvers, through: :solutions, source: :user, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true
  validates :answer, presence: true

  def check(proposed_answer)
    answer.casecmp(proposed_answer).zero?
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
