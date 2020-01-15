class RoomMessageSerializer < ActiveModel::Serializer
  attributes :id, :message
  has_one :room
  has_one :user
end
