class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :destroy
  has_many :guests, through: :attendances, source: :user

  validates :description, presence: true, uniqueness: true
end
