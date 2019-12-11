class Friend < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :friend_id
  validates_uniqueness_of :friend_id, scope: %i[user_id friend_id]
end
