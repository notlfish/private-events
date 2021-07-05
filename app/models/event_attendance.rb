class EventAttendance < ApplicationRecord
  validates :attendee, presence: true
  validates :attended_event, presence: true

  belongs_to :attended_event, class_name: 'Event'
  belongs_to :attendee, class_name: 'User'
end
