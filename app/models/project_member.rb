class ProjectMember < ApplicationRecord
  belongs_to :project
  belongs_to :member
  validates :capacity_member, presence: true
end
