class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :asana_token, :string
    add_column :projects, :trello_token, :string
    add_column :projects, :google_token, :string
    add_column :projects, :slack_token, :string
    add_column :projects, :jira_token, :string
    add_column :projects, :asana_workspace, :string
  end
end
