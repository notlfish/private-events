class Event < ApplicationRecord
  validates :date, presence: true
  validates :name, presence: true
  validates :venue, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :event_attendances

  # def self.past_events_of(user)
  #   user.attended_events.where(["date < ?", DateTime.now])
  # end

  # def self.future_events_of(user)
  #   user.attended_events.where(["date > ?", DateTime.now ])
  # end

  scope :future_events_of, ->(user) { user.attended_events.where(['date > ?', DateTime.now]) }

  scope :past_events_of, ->(user) { user.attended_events.where(['date < ?', DateTime.now]) }
end
