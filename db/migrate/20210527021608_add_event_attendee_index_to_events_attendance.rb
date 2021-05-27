class AddEventAttendeeIndexToEventsAttendance < ActiveRecord::Migration[6.1]
  def change
    add_index :events_attendance, [:attended_event_id, :attendee_id], :unique => true
    #Ex:- add_index("admin_users", "username")
  end
end
