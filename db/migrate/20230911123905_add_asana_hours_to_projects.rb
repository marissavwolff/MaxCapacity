class AddAsanaHoursToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :asana_hours, :string
  end
end
