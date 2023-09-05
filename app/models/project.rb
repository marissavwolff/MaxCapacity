class Project < ApplicationRecord
  belongs_to :user
  has_many :members, through: :project_members
  validates :name, presence: true
  validates :deadline, presence: true
  validates :capacity, presence: true
  validates :tool_system, inclusion: { in: ["jira", "asana", "google meets", "slack"] }

  include PgSearch::Model
  pg_search_scope :search,
  against: [ :title ],
  using: {
    tsearch: { prefix: true }
  }
end
