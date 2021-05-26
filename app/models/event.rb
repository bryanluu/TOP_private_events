class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_and_belongs_to_many :attendees, join_table: "events_attendance", class_name: "User", foreign_key: "attended_event_id", association_foreign_key: "attendee_id"

  validates :title, presence: true
  validates :date, presence: true
end
