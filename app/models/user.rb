class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :telephone, presence: true, uniqueness: true
  validates_presence_of :password, on: :create

  has_and_belongs_to_many :friends,
                        class_name: 'User',
                        join_table: :friends,
                        foreign_key: :users_id,
                        association_foreign_key: :friend_id
end
