class Project < ApplicationRecord
  belongs_to :user
  has_many :members, through: :project_members
end
