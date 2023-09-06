class Member < ApplicationRecord
  has_many :project_members
  has_many :projects, through: :project_members
  validates :name, presence: true
  validates :title, presence: true
  has_one_attached :photo
end
