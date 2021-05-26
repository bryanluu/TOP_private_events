class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :title, presence: true
  validates :date, presence: true
end
