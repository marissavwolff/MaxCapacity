class Tool < ApplicationRecord
  belongs_to :project
  enum :status, { jira: 0, asana: 1, google_meets: 2, slack: 3 }
end
