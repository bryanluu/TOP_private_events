class AddDescriptionToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :desc, :text
  end
end
