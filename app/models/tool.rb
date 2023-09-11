class Tool < ApplicationRecord
  belongs_to :project
  enum :app, { jira: 0, asana: 1, google_meets: 2, Trello: 3 }
end
