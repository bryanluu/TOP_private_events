class CreateAttendanceJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :attendees, :attended_events, table_name: :events_attendance do |t|
      # t.index [:attendee_id, :attended_event_id], foreign_key: true
      t.index :attended_event_id, unique: false
      t.index :attendee_id, unique: false
    end
  end
end
