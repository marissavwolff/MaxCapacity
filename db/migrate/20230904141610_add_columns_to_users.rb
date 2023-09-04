class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :telephone_number, :string
    add_column :users, :title, :string
    add_column :users, :company, :string
  end
end
