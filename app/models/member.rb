class Member < ApplicationRecord
  has_many :projects, through: :project_members
end
