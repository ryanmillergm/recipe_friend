class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :telephone, presence: true, uniqueness: true
end
