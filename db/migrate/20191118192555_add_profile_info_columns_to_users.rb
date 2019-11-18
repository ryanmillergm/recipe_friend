class AddProfileInfoColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar, :text
    add_column :users, :quote, :string
  end
end
