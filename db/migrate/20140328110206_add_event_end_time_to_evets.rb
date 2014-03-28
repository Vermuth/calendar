class AddEventEndTimeToEvets < ActiveRecord::Migration
  def change
    add_column :events, :event_end_time, :date
  end
end
