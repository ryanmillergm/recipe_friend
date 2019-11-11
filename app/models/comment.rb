class Comment < ApplicationRecord
  validates_presence_of :content, presence: true, length: { minimum: 2 }
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user
end
