class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy

  has_many :event_attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :attended_events, through: :event_attendances
end
