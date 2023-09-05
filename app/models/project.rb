class Project < ApplicationRecord
  belongs_to :user
  has_many :members, through: :project_members
  validates :title, presence: true
  validates :deadline, presence: true
  validates :capacity, presence: true

  include PgSearch::Model
  pg_search_scope :search,
  against: [ :title ],
  using: {
    tsearch: { prefix: true }
  }
end
