class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :uid, :string
  end
end
