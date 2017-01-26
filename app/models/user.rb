class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  has_many :solutions, dependent: :destroy
  has_many :solved_challenges, through: :solutions, source: :challenge

  validates :username, presence: true, uniqueness: true

  after_create :assign_default_role
  after_validation :move_friendly_id_error_to_username

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def should_generate_new_friendly_id?
    username_changed?
  end

  def move_friendly_id_error_to_username
    errors.add :username, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
end
