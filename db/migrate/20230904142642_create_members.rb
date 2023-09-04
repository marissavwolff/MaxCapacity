class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :company
      t.string :title
      t.string :email
      t.integer :capacity
      t.string :line_manager

      t.timestamps
    end
  end
end
