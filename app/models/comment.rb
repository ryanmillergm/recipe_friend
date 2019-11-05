class Comment < ApplicationRecord
  validates_presence_of :content
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :recipe
end
