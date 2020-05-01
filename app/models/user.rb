class User < ApplicationRecord
  has_many :events_as_creator, foreign_key: :creator_id, class_name: 'Event'
  has_many :attendances
  has_many :events_as_guest, through: :attendances, source: :event
end
