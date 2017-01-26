class Challenge < ApplicationRecord
  belongs_to :category
  has_many :solutions, dependent: :destroy
  has_many :solvers, through: :solutions, source: :user
end
