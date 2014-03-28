class CreateRecurrings < ActiveRecord::Migration
  def change
    create_table :recurrings do |t|
      t.date        :recurring_start
      t.date        :recurring_stop
      t.integer     :event_id
      t.timestamps
    end
  end
end
