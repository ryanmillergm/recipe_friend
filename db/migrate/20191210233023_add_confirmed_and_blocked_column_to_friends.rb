class AddConfirmedAndBlockedColumnToFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :confirmed, :boolean, default: false
    add_column :friends, :blocked, :boolean, default: false
  end
end
