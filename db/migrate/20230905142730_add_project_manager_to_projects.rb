class AddProjectManagerToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_manager, :string
  end
end
