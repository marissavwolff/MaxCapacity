class RemoveColumnsFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :googletoken, :string
    remove_column :members, :asanatoken, :string
    remove_column :members, :jiratoken, :string
    remove_column :members, :trellotoken, :string
    remove_column :members, :slacktoken, :string
  end
end
