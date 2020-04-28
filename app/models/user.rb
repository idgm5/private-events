class User < ApplicationRecord
  has_many :events
  has_many :guests
  has_many :assisted_events, through: :guests
end
