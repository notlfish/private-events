class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendee

  has_many :event_attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendances
end
