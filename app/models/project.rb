class Project < ApplicationRecord
  belongs_to :user
  has_many :members, through: :project_members
  validates :name, presence: true
  validates :deadline, presence: true
  validates :capacity, presence: true
end
