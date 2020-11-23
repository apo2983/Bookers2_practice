class Room < ApplicationRecord
  has_many :user_rooms,dependent: :destroy
  accepts_nested_attributes_for :user_rooms
  
  has_many :chats,dependent: :destroy
end
