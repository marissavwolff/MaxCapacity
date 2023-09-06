class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :app, default: 0
      t.string :link

      t.timestamps
    end
  end
end
