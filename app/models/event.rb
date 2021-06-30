class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendee

  has_many :event_attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendances

  # def self.past_events_of(user)
  #   user.attended_events.where(["date < ?", DateTime.now])
  # end

  # def self.future_events_of(user)
  #   user.attended_events.where(["date > ?", DateTime.now ])
  # end

  scope :future_events_of, -> (user) { where(["date > ?", DateTime.now]) }


  scope :past_events_of, -> (user) { where(["date < ?", DateTime.now]) }
end


