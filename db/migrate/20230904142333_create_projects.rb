class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :deadline
      t.integer :capacity
      t.string :description
      t.string :priority
      t.string :tool_system
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
