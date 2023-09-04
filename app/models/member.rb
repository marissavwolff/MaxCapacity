class Member < ApplicationRecord
  has_many :projects, through: :project_members
  validates :name, presence: true
  validates :title, presence: true
  validates :capacity, presence: true
end
