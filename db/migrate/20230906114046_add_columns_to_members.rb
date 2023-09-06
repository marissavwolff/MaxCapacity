class AddColumnsToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :asanatoken, :string
    add_column :members, :trellotoken, :string
    add_column :members, :jiratoken, :string
    add_column :members, :slacktoken, :string
    add_column :members, :googletoken, :string
  end
end
